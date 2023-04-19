const fileInput = document.querySelector('.fileInput');
const imageContainer = document.getElementById('imageContainer');

fileInput.addEventListener('change', (event) => {
    const file = event.target.files[0];
    const reader = new FileReader();

    reader.addEventListener('load', () => {
        const imageUrl = reader.result;
        imageContainer.src = imageUrl;
    });

    reader.readAsDataURL(file);
});


fileInput.addEventListener('change', (event) => {
    let prevthumbnail = document.getElementById('prevthumbnail');
    if (event.target.files.length > 0) {
        prevthumbnail.disabled = true;
    }
})

const pdfContainer = document.getElementById('pdfContainer');
const pdfInput = document.getElementById('file');
if(pdfInput){
    pdfInput.addEventListener('change', (event) => {
        const file = event.target.files[0];
        const reader = new FileReader();

        reader.addEventListener('load', async () => {
            if (pdfContainer.childNodes.length > 0) {
                pdfContainer.removeChild(document.getElementById('canvasElement'))
            }
            const pdfData = new Uint8Array(reader.result);
            const pdf = await pdfjsLib.getDocument({ data: pdfData }).promise;
            const page = await pdf.getPage(1);
            const scale = 0.55;
            const viewport = page.getViewport({ scale });
            const canvas = document.createElement('canvas');
            canvas.id = "canvasElement";
            const context = canvas.getContext('2d');
            canvas.height = 300;
            canvas.width = 300;
            const renderContext = {
                canvasContext: context,
                viewport,
            };
            await page.render(renderContext).promise;
            pdfContainer.appendChild(canvas);
        });

        reader.readAsArrayBuffer(file);
    });
}
