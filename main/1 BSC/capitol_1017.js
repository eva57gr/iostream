var from = "";

$(document).ready(function () {
    form = $("#formDenShort").val();
    f_Capitol_1017();
});

$(function () {
    // OnKeyPress ```````````````````````````````````````````````````````````````````````````````
    $("input:not([type='button']):not([readonly]):not([disabled])").on("change", function (e) {
        f_Capitol_1017();
    });
});

//It is js code. But don't work.
function f_Capitol_1017() {
    var R000_C1 = $("#19_1017_11849_000_1");
    var R498_C1 = $("#19_1017_11860_498_1");
    var R999_C1 = $("#19_1017_11861_999_1");
    var R008_C1 = $("#19_1017_12341_008_1");
    var R682_C1 = $("#19_1017_12474_682_1");
    
    // Trebuie sa fie asa
    // Prima autosuma   - R000_C1 = R999_C1 + R498_C1 
    // A doua autosuma  - R999_C1 = R008_C1 + R682_C1

    //--------------readOnly input -----------------------

    R000_C1.prop("readonly", true);
    R999_C1.prop("readonly", true);
    var values_R999_C1 = [

        parseInt(R008_C1.val()) || 0,
        parseInt(R682_C1.val()) || 0

    ];

    // Calculate the sum of all values
    var sum = values_R999_C1.reduce((acc, curr) => acc + curr, 0);

    // Set the value of R200_C1 to the calculated sum or an empty string if any input field is empty
    R999_C1.val(sum === 0 ? "" : sum);

    var values_R000_C1 = [

        parseInt(R498_C1.val()) || 0,
        parseInt(R999_C1.val()) || 0

    ];

    // Calculate the sum of all values
    var sum = values_R000_C1.reduce((acc, curr) => acc + curr, 0);

    // Set the value of R200_C1 to the calculated sum or an empty string if any input field is empty
    R000_C1.val(sum === 0 ? "" : sum);



   }

