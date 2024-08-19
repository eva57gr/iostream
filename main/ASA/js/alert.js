// Calculate the sums
rowIDs.forEach(function (row) {
    var col1Val = parseFloat($("#47_1035_" + row.id + "_" + row.rind + "_1").val()) || 0.000;
    sumCol1 += col1Val;

    var col2Val = parseFloat($("#47_1035_" + row.id + "_" + row.rind + "_2").val()) || 0.000;
    sumCol2 += col2Val;

    var col3Val = parseFloat($("#47_1035_" + row.id + "_" + row.rind + "_3").val()) || 0.000;
    sumCol3 += col3Val;

    var col5Val = parseFloat($("#47_1035_" + row.id + "_" + row.rind + "_5").val()) || 0.000;
    sumCol5 += col5Val;

    var col6Val = parseFloat($("#47_1035_" + row.id + "_" + row.rind + "_6").val()) || 0.000;
    sumCol6 += col6Val;

    var col7Val = parseFloat($("#47_1035_" + row.id + "_" + row.rind + "_7").val()) || 0.000;
    sumCol7 += col7Val;

    // Calculate column 4 as the sum of columns 5, 6, and 7
    var col4Val = col5Val + col6Val + col7Val;
    $("#47_1035_" + row.id + "_" + row.rind + "_4").val(col4Val.toFixed(3)); // Set the value in the input field
    $("#47_1035_" + row.id + "_" + row.rind + "_4").prop("readonly", true);  // Make column 4 read-only
    sumCol4 += col4Val;

    var col8Val = parseFloat($("#47_1035_" + row.id + "_" + row.rind + "_8").val()) || 0.000;
    sumCol8 += col8Val;

    var col9Val = parseFloat($("#47_1035_" + row.id + "_" + row.rind + "_9").val()) || 0.000;
    sumCol9 += col9Val;
});
