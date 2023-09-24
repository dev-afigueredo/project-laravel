'use strict';

var qrcode;

// Set the URL you want to share
var sharedURL = "";

// Generate QR code with the shared URL
function generateQrcode(url) {
    qrcode = new QRCode("qrcode", {
        width: 200,
        height: 200
    });

    sharedURL = url;
    qrcode.makeCode(sharedURL);

    $('#urlInput').val(url);
}

// Clear QR code when the modal is closed
$('#shareModal').on('hide.bs.modal', function () {
    qrcode.clear();
    $('#qrcode').empty();
});

// Share function
function share() {
    if (navigator.share) {
        navigator.share({
            title: document.title,
            text: "Confira esse compartilhamento!",
            url: sharedURL
        })
            .then(() => console.log('Compartilhado com sucesso.'))
            .catch((error) => console.log('Erro no compartilhamento:', error));
    } else {
        alert("O compartilhamento não é compatível com este navegador.");
    }
}

// Copy URL to clipboard
function copyToClipboard() {
    var urlInput = document.getElementById("urlInput");
    urlInput.select();
    urlInput.setSelectionRange(0, 99999);
    document.execCommand("copy");
    alert("Link copiado com sucesso!");
}