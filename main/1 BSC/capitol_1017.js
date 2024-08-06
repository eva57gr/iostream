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
    
    //--------------readOnly input -----------------------

    R000_C1.prop("readonly", true);
   
    var values_R000_C1 = [
       
        parseInt(R498_C1.val()) || 0,
        parseInt(R999_C1.val()) || 0
        
    ];

    // Calculate the sum of all values
    var sum = values_R000_C1.reduce((acc, curr) => acc + curr, 0);

    // Set the value of R200_C1 to the calculated sum or an empty string if any input field is empty
    R000_C1.val(sum === 0 ? "" : sum);

   }

