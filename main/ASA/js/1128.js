
// Ensure 'from' is a global variable
//In the excel file are all the rows with id. Create the missing variables and the id attributes id  to the example of row 500 and continue the sum. Row 500 must be equal to the sum of all rows. And give me all code final. 

var from = "";
$(document).ready(function () {
    // Initialize form variable
    from = $("#formDenShort").val();

    // Initial calculation
    f_Capitol_1128();

    // Attach event listener to all input fields initially present
    $("input:not([type='button']):not([readonly]):not([disabled])").on("change", function (e) {
        f_Capitol_1128();
    });

    // Use event delegation to handle dynamically added rows
    $(document).on("change", "input:not([type='button']):not([readonly]):not([disabled])", function (e) {
        f_Capitol_1128();
    });
});

function f_Capitol_1128() {

    var R500_C8 = $("#64_1128_59030_500_8");
    var R510_C8 = $("#64_1128_59032_510_8");
    var R511_C8 = $("#64_1128_59033_511_8");
    var R512_C8 = $("#64_1128_59034_512_8");




    // Make specific fields read-only
    R500_C8.prop("readonly", true);




    // Calculate sum for R500_C8
    var values_R500_C8 = [
        parseFloat(R510_C8.val()) || 0.0,
        parseFloat(R511_C8.val()) || 0.0,
        parseFloat(R512_C8.val()) || 0.0
        
    ];

    var sum_R500_C8 = values_R500_C8.reduce((acc, curr) => acc + curr, 0);
    R500_C8.val(sum_R500_C8 === 0 ? "" : sum_R500_C8);


}
