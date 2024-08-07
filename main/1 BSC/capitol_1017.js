//This is my file 
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

//

function f_Capitol_1017() {

    var R000_C1 = 0;
    var R498_C1 = 0;
    var R999_C1 = 0;
    var R008_C1 = 0;
    var R682_C1 = 0;
    var R036_C1 = 0;
    var R148_C1 = 0;

    var R000_C1 = $("#19_1017_11849_000_1"); 
    var R498_C1 = $("#19_1017_11860_498_1");
    var R999_C1 = $("#19_1017_11861_999_1");
    var R008_C1 = $("#19_1017_12341_008_1");
    var R682_C1 = $("#19_1017_12474_682_1");
    var R036_C1 = $("#19_1017_12340_036_1");  // Dinamic row
    var R148_C1 = $("#19_1017_78472_148_1");  // Dinamic row  


    
    //--------------readOnly input -----------------------

    R000_C1.prop("readonly", true);
    R999_C1.prop("readonly", true);
    var values_R999_C1 = [

        parseInt(R008_C1.val()) || 0,
        parseInt(R682_C1.val()) || 0,
        parseInt(R036_C1.val()) || 0,
        parseInt(R148_C1.val()) || 0

    ];

         var sum_R999_C1= 0; 
         sum_R999_C1 = values_R999_C1.reduce((acc, curr) => acc + curr, 0);

         R999_C1.val(sum_R999_C1 === 0 ? "" : sum_R999_C1);


    var values_R000_C1 = [

        parseInt(R498_C1.val()) || 0,
        parseInt(R999_C1.val()) || 0

    ];

    
         var sum_R000_C1 = 0; 
         sum_R000_C1  = values_R000_C1.reduce((acc, curr) => acc + curr, 0);

         R000_C1.val(sum_R000_C1 === 0 ? "" : sum_R000_C1);



   }

