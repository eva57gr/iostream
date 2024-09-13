var from = "";

$(document).ready(function () {
    form = $("#formDenShort").val();
    f1CMPA_CAPII();
});

$(function () {
    // OnKeyPress ```````````````````````````````````````````````````````````````````````````````
    $("input:not([type='button']):not([readonly]):not([disabled])").on("change", function (e) {
        f1CMPA_CAPII();
    });
});


function f1CMPA_CAPII() {

    //alert("test");

    var R010_C1 = $("#61_1111_64380_010_1");
    var R010_C2 = $("#61_1111_64380_010_2");
    var R011_C1 = $("#61_1111_64367_011_1");
    var R011_C2 = $("#61_1111_64367_011_2");
    var R012_C1 = $("#61_1111_64403_012_1");
    var R012_C2 = $("#61_1111_64403_012_2");
    var R013_C1 = $("#61_1111_64370_013_1");
    var R013_C2 = $("#61_1111_64370_013_2");
    var R014_C1 = $("#61_1111_64371_014_1");
    var R014_C2 = $("#61_1111_64371_014_2");
    var R015_C1 = $("#61_1111_64377_015_1");
    var R015_C2 = $("#61_1111_64377_015_2");
    var R016_C1 = $("#61_1111_64381_016_1");
    var R016_C2 = $("#61_1111_64381_016_2");
    var R017_C1 = $("#61_1111_64404_017_1");
    var R017_C2 = $("#61_1111_64404_017_2");

    var R020_C1 = $("#61_1111_64372_020_1");
    var R020_C2 = $("#61_1111_64372_020_2");
    var R021_C1 = $("#61_1111_64382_021_1");
    var R021_C2 = $("#61_1111_64382_021_2");
    var R022_C1 = $("#61_1111_64373_022_1");
    var R022_C2 = $("#61_1111_64373_022_2");
    var R023_C1 = $("#61_1111_64395_023_1");
    var R023_C2 = $("#61_1111_64395_023_2");
    var R024_C1 = $("#61_1111_64374_024_1");
    var R024_C2 = $("#61_1111_64374_024_2");
    var R030_C1 = $("#61_1111_64396_030_1");
    var R030_C2 = $("#61_1111_64396_030_2");

    var R040_C1 = $("#61_1111_64368_040_1");
    var R040_C2 = $("#61_1111_64368_040_2");
    var R041_C1 = $("#61_1111_64400_041_1");
    var R041_C2 = $("#61_1111_64400_041_2");
    var R042_C1 = $("#61_1111_64389_042_1");
    var R042_C2 = $("#61_1111_64389_042_2");
    var R043_C1 = $("#61_1111_64390_043_1");
    var R043_C2 = $("#61_1111_64390_043_2");
    var R044_C1 = $("#61_1111_64405_044_1");
    var R044_C2 = $("#61_1111_64405_044_2");
    var R045_C1 = $("#61_1111_64378_045_1");
    var R045_C2 = $("#61_1111_64378_045_2");
    var R046_C1 = $("#61_1111_64383_046_1");
    var R046_C2 = $("#61_1111_64383_046_2");
    var R047_C1 = $("#61_1111_64384_047_1");
    var R047_C2 = $("#61_1111_64384_047_2");

    var R048_C1 = $("#61_1111_64385_048_1");
    var R048_C2 = $("#61_1111_64385_048_2");
    var R049_C1 = $("#61_1111_64401_049_1");
    var R049_C2 = $("#61_1111_64401_049_2");
    var R050_C1 = $("#61_1111_64397_050_1");
    var R050_C2 = $("#61_1111_64397_050_2");
    var R051_C1 = $("#61_1111_64375_051_1");
    var R051_C2 = $("#61_1111_64375_051_2");
    var R052_C1 = $("#61_1111_64402_052_1");
    var R052_C2 = $("#61_1111_64402_052_2");
    var R053_C2 = $("#61_1111_64391_053_2");
    var R053_C1 = $("#61_1111_64391_053_1");
    var R054_C2 = $("#61_1111_64386_054_2");
    var R054_C1 = $("#61_1111_64386_054_1");

    var R060_C2 = $("#61_1111_64369_060_2");
    var R060_C1 = $("#61_1111_64369_060_1");

    var R070_C2 = $("#61_1111_64398_070_2");
    var R070_C1 = $("#61_1111_64398_070_1");
    var R071_C2 = $("#61_1111_64392_071_2");
    var R071_C1 = $("#61_1111_64392_071_1");
    var R072_C2 = $("#61_1111_64379_072_2");
    var R072_C1 = $("#61_1111_64379_072_1");

    var R080_C2 = $("#61_1111_64406_080_2");
    var R080_C1 = $("#61_1111_64406_080_1");
    var R081_C2 = $("#61_1111_64393_081_2");
    var R081_C1 = $("#61_1111_64393_081_1");
    var R082_C2 = $("#61_1111_64387_082_2");
    var R082_C1 = $("#61_1111_64387_082_1");
    var R083_C2 = $("#61_1111_64376_083_2");
    var R083_C1 = $("#61_1111_64376_083_1");

    var R090_C2 = $("#61_1111_64388_090_2");
    var R090_C1 = $("#61_1111_64388_090_1");


    var R100_C2 = $("#61_1111_64407_100_2");
    var R100_C1 = $("#61_1111_64407_100_1");



    //--------------readOnly input -----------------------

    R040_C1.prop("readonly", true);
    R040_C2.prop("readonly", true);

    R070_C1.prop("readonly", true);
    R070_C2.prop("readonly", true);

    R080_C1.prop("readonly", true);
    R080_C2.prop("readonly", true);

    R100_C1.prop("readonly", true);
    R100_C2.prop("readonly", true);



    //-------------------------------Rind 040------------------------------------------------------
    R040_C1.val(parseInt(R041_C1.val() * 1 + R042_C1.val() * 1 + R043_C1.val() * 1 + R044_C1.val() * 1 + R045_C1.val() * 1 + R046_C1.val() * 1 + R047_C1.val() * 1 + R048_C1.val() * 1 + R049_C1.val() * 1 + R050_C1.val() * 1 + R051_C1.val() * 1 + R052_C1.val() * 1 + R053_C1.val() * 1 + R054_C1.val() * 1));

    R040_C2.val(Number(parseFloat(Number(R041_C2.val())) + parseFloat(Number(R042_C2.val())) + parseFloat(Number(R043_C2.val())) + parseFloat(Number(R044_C2.val())) + parseFloat(Number(R045_C2.val()))
        + parseFloat(Number(R046_C2.val())) + parseFloat(Number(R047_C2.val())) + parseFloat(Number(R048_C2.val())) + parseFloat(Number(R049_C2.val())) + parseFloat(Number(R050_C2.val()))
        + parseFloat(Number(R051_C2.val())) + parseFloat(Number(R052_C2.val())) + parseFloat(Number(R053_C2.val())) + parseFloat(Number(R054_C2.val()))).toFixed(5));


    //-------------------------------Rind 070------------------------------------------------------
    R070_C1.val(parseInt(R071_C1.val() * 1 + R072_C1.val() * 1));
    R070_C2.val(Number(parseFloat(Number(R071_C2.val())) + parseFloat(Number(R072_C2.val()))).toFixed(5));


    //-------------------------------Rind 080------------------------------------------------------
    R080_C1.val(parseInt(R081_C1.val() * 1 + R082_C1.val() * 1 + R083_C1.val() * 1));
    R080_C2.val(Number(parseFloat(Number(R081_C2.val())) + parseFloat(Number(R082_C2.val())) + parseFloat(Number(R083_C2.val()))).toFixed(5));



    //-------------------------------Rind 100------------------------------------------------------
    R100_C1.val(parseInt(R010_C1.val() * 1 + R011_C1.val() * 1 + R012_C1.val() * 1 + R013_C1.val() * 1 + R014_C1.val() * 1 + R015_C1.val() * 1 + R016_C1.val() * 1 + R017_C1.val() * 1 +
      R020_C1.val() * 1 + R021_C1.val() * 1 + R022_C1.val() * 1 + R023_C1.val() * 1 + R024_C1.val() * 1 +
      R030_C1.val() * 1 + R040_C1.val() * 1 + R060_C1.val() * 1 + R070_C1.val() * 1 + R080_C1.val() * 1 + R090_C1.val() * 1));


   R100_C2.val(Number(parseFloat(Number(R010_C2.val())) + parseFloat(Number(R011_C2.val())) + parseFloat(Number(R012_C2.val())) + parseFloat(Number(R013_C2.val())) + parseFloat(Number(R014_C2.val()))
     + parseFloat(Number(R015_C2.val())) + parseFloat(Number(R016_C2.val())) + parseFloat(Number(R017_C2.val())) + parseFloat(Number(R020_C2.val())) + parseFloat(Number(R021_C2.val()))
     + parseFloat(Number(R022_C2.val())) + parseFloat(Number(R023_C2.val())) + parseFloat(Number(R024_C2.val())) + parseFloat(Number(R030_C2.val())) + parseFloat(Number(R040_C2.val())) + parseFloat(Number(R060_C2.val()))
     + parseFloat(Number(R070_C2.val())) + parseFloat(Number(R080_C2.val())) + parseFloat(Number(R090_C2.val()))).toFixed(5));





}

