var from = "";

$(document).ready(function () {
    form = $("#formDenShort").val();
    f1_cap1_16_agro();
});

$(function () {
    // OnKeyPress ```````````````````````````````````````````````````````````````````````````````
    $("input:not([type='button']):not([readonly]):not([disabled])").on("change", function (e) {
        f1_cap1_16_agro();
    });
});


function f1_cap1_16_agro() {
    var R200_C1 = $("#36_383_78145_200_1");
    var R200_C2 = $("#36_383_78145_200_2");
    var R200_C3 = $("#36_383_78145_200_3");
    var R200_C4 = $("#36_383_78145_200_4");
    var R200_C5 = $("#36_383_78145_200_5");
    var R205_C1 = $("#36_383_78141_205_1");
    var R210_C1 = $("#36_383_78162_210_1");
    var R220_C1 = $("#36_383_78128_220_1");
    var R225_C1 = $("#36_383_78150_225_1");
    var R230_C1 = $("#36_383_78136_230_1"); 
    var R235_C1 = $("#36_383_78137_235_1");
    var R240_C1 = $("#36_383_78155_240_1");
    var R245_C1 = $("#36_383_78163_245_1");
    var R250_C1 = $("#36_383_78129_250_1");
    var R255_C1 = $("#36_383_78156_255_1");
    var R265_C1 = $("#36_383_78142_265_1");
    var R270_C1 = $("#36_383_78135_270_1");
    var R275_C1 = $("#36_383_78157_275_1");

    // Set readOnly property to true for all R200 input fields
    R200_C1.prop("readonly", true);
    R200_C2.prop("readonly", true);
    R200_C3.prop("readonly", true);
    R200_C4.prop("readonly", true);
    R200_C5.prop("readonly", true);

    // Get the values of all input fields and convert them to numbers
    var values = [
        parseInt(R205_C1.val()) || 0,
        parseInt(R210_C1.val()) || 0,
        parseInt(R220_C1.val()) || 0,
        parseInt(R225_C1.val()) || 0,
        parseInt(R230_C1.val()) || 0, 
        parseInt(R235_C1.val()) || 0,
        parseInt(R240_C1.val()) || 0,
        parseInt(R245_C1.val()) || 0,
        parseInt(R250_C1.val()) || 0,
        parseInt(R255_C1.val()) || 0,
        parseInt(R265_C1.val()) || 0,
        parseInt(R270_C1.val()) || 0,
        parseInt(R275_C1.val()) || 0
    ];

    // Calculate the sum of all values
    var sum = values.reduce((acc, curr) => acc + curr, 0);

    // Set the value of R200_C1 to the calculated sum or an empty string if any input field is empty
    R200_C1.val(sum === 0 ? "" : sum);
}

//Now I am sending you the whole function so that you can understand it better