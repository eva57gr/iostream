function sumCap1034_Rind0000000() {
    // Row IDs for Cap. III, Rind.0000000 summation
    //47_1034_70282_0000000_1
    var rowIDs = [
        { id: "71140", rind: "0100000" }, {id: "70912", rind: "0101000" }
    ];
    var sumCol1 = 0.000;
    var sumCol2 = 0.000;
    var sumCol3 = 0.000;
    var sumCol4 = 0.000;
    var sumCol5 = 0.000;
    var sumCol6 = 0.000;
    var sumCol7 = 0.000;
    var sumCol8 = 0.000;
    var sumCol9 = 0.000;

    // Calculate the sums
    rowIDs.forEach(function (row) {
        var col1Val = parseFloat($("#47_1034_" + row.id + "_" + row.rind + "_1").val()) || 0.000;
        
        sumCol1 += col1Val;
    });

    // Apply rounding and set the values
    var rind0000000Col1 = $("#47_1034_70282_0000000_1");
    

    rind0000000Col1.val(sumCol1 !== 0 ? sumCol1.toFixed(3) : ""); // Assign empty string if sum is 0
   

    // Make Rind.999 columns read-only
    rind0000000Col1.prop("readonly", true);
    
}



// Update the main function to include the new logic
function f_Capitol_1034() {
    // Execute the custom functions
    sumCap1034_Rind0000000();
    
 }

var from = "";
// Ensure f_Capitol_1034 is called on document ready and input changes as per original code
$(document).ready(function () {

    // Initialize form variable
    from = $("#formDenShort").val();
    f_Capitol_1034();
    $("input:not([type='button']):not([readonly]):not([disabled])").on("change", f_Capitol_1034);
    $(document).on("change", "input:not([type='button']):not([readonly]):not([disabled])", f_Capitol_1034);
});
