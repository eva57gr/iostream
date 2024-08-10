// Ensure 'from' is a global variable
var from = "";
$(document).ready(function () {
    // Initialize form variable
    from = $("#formDenShort").val();

    // Initial calculation
    f_Capitol_1127();

    // Attach event listener to all input fields initially present
    $("input:not([type='button']):not([readonly]):not([disabled])").on("change", function (e) {
        f_Capitol_1127();
    });

    // Use event delegation to handle dynamically added rows
    $(document).on("change", "input:not([type='button']):not([readonly]):not([disabled])", function (e) {
        f_Capitol_1127();
    });
});

function f_Capitol_1127() {
    // These variables receive numbers with one digit after the comma.
    var R400_C3 = $("#64_1127_69986_400_3");
    var R410_C3 = $("#64_1127_70092_410_3");
    var R411_C3 = $("#64_1127_70002_411_3");
    var R412_C3 = $("#64_1127_69987_412_3");

    // Make specific fields read-only
    R400_C3.prop("readonly", true);

    // Calculate sum for R000_C1
    var values_R400_C3 = [
        parseFloat(R410_C3.val()) || 0.0,
        parseFloat(R411_C3.val()) || 0.0,
        parseFloat(R412_C3.val()) || 0.0
    ];

    var sum_R400_C3 = values_R400_C3.reduce((acc, curr) => acc + curr, 0.0);
    R400_C3.val(sum_R400_C3 === 0 ? "" : sum_R400_C3.toFixed(1));
}
