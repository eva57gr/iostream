
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
    // Variable declarations for each row
    var R400_C3 = $("#64_1127_69986_400_3");
    var R410_C3 = $("#64_1127_70092_410_3");
    var R411_C3 = $("#64_1127_70002_411_3");
    var R412_C3 = $("#64_1127_69987_412_3");
    var R413_C3 = $("#64_1127_70132_413_3");
    var R414_C3 = $("#64_1127_70068_414_3");
    var R415_C3 = $("#64_1127_70069_415_3");
    var R416_C3 = $("#64_1127_70133_416_3");
    var R417_C3 = $("#64_1127_70093_417_3");
    var R418_C3 = $("#64_1127_70052_418_3");
    var R419_C3 = $("#64_1127_70094_419_3");
    var R420_C3 = $("#64_1127_70003_420_3");
    var R421_C3 = $("#64_1127_70112_421_3");
    var R422_C3 = $("#64_1127_70095_422_3");
    var R423_C3 = $("#64_1127_70070_423_3");
    var R424_C3 = $("#64_1127_70029_424_3");
    var R425_C3 = $("#64_1127_70030_425_3");
    var R426_C3 = $("#64_1127_70071_426_3");
    var R427_C3 = $("#64_1127_70031_427_3");
    var R428_C3 = $("#64_1127_70004_428_3");
    var R429_C3 = $("#64_1127_70072_429_3");
    var R430_C3 = $("#64_1127_70134_430_3");
    var R431_C3 = $("#64_1127_70005_431_3");
    var R432_C3 = $("#64_1127_70113_432_3");
    var R433_C3 = $("#64_1127_70073_433_3");
    var R434_C3 = $("#64_1127_70096_434_3");
    var R435_C3 = $("#64_1127_70074_435_3");
    var R436_C3 = $("#64_1127_70135_436_3");
    var R437_C3 = $("#64_1127_70136_437_3");
    var R438_C3 = $("#64_1127_70075_438_3");
    var R439_C3 = $("#64_1127_70137_439_3");
    var R440_C3 = $("#64_1127_70006_440_3");
    var R441_C3 = $("#64_1127_70138_441_3");
    var R442_C3 = $("#64_1127_69988_442_3");
    var R443_C3 = $("#64_1127_70007_443_3");
    var R444_C3 = $("#64_1127_70008_444_3");
    var R445_C3 = $("#64_1127_70032_445_3");
    var R446_C3 = $("#64_1127_70097_446_3");
    var R447_C3 = $("#64_1127_70053_447_3");
    var R448_C3 = $("#64_1127_70054_448_3");
    var R449_C3 = $("#64_1127_70033_449_3");
    var R450_C3 = $("#64_1127_70034_450_3");
    var R451_C3 = $("#64_1127_70076_451_3");
    var R452_C3 = $("#64_1127_70035_452_3");
    var R453_C3 = $("#64_1127_70098_453_3");
    var R454_C3 = $("#64_1127_70099_454_3");
    var R455_C3 = $("#64_1127_70009_455_3");
    var R456_C3 = $("#64_1127_70114_456_3");
    var R457_C3 = $("#64_1127_69989_457_3");
    var R458_C3 = $("#64_1127_70100_458_3");
    var R459_C3 = $("#64_1127_70010_459_3");
    var R460_C3 = $("#64_1127_70011_460_3");
    var R461_C3 = $("#64_1127_70077_461_3");
    var R462_C3 = $("#64_1127_69990_462_3");
    var R463_C3 = $("#64_1127_70036_463_3");
    var R464_C3 = $("#64_1127_70115_464_3");
    var R465_C3 = $("#64_1127_69991_465_3");
    var R466_C3 = $("#64_1127_70012_466_3");
    var R467_C3 = $("#64_1127_70078_467_3");
    var R468_C3 = $("#64_1127_70013_468_3");
    var R469_C3 = $("#64_1127_70055_469_3");
    var R470_C3 = $("#64_1127_69992_470_3");
    var R471_C3 = $("#64_1127_70116_471_3");
    var R472_C3 = $("#64_1127_70079_472_3");
    var R473_C3 = $("#64_1127_70101_473_3");
    var R474_C3 = $("#64_1127_70139_474_3");
    var R475_C3 = $("#64_1127_70117_475_3");
    var R476_C3 = $("#64_1127_70080_476_3");
    var R477_C3 = $("#64_1127_70014_477_3");
    var R478_C3 = $("#64_1127_70102_478_3");
    var R479_C3 = $("#64_1127_70103_479_3");
    var R480_C3 = $("#64_1127_70140_480_3");
    var R481_C3 = $("#64_1127_70141_481_3");
    var R482_C3 = $("#64_1127_70081_482_3");
    var R483_C3 = $("#64_1127_70142_483_3");
    var R484_C3 = $("#64_1127_70056_484_3");
    var R485_C3 = $("#64_1127_70037_485_3");
    var R486_C3 = $("#64_1127_70143_486_3");
    var R487_C3 = $("#64_1127_70118_487_3");
    var R488_C3 = $("#64_1127_70082_488_3");
    var R489_C3 = $("#64_1127_70104_489_3");
    var R490_C3 = $("#64_1127_70119_490_3");
    var R491_C3 = $("#64_1127_70105_491_3");
    var R492_C3 = $("#64_1127_70120_492_3");
    var R493_C3 = $("#64_1127_70106_493_3");
    var R494_C3 = $("#64_1127_70107_494_3");
    var R495_C3 = $("#64_1127_70015_495_3");
    var R496_C3 = $("#64_1127_70016_496_3");
    var R497_C3 = $("#64_1127_70083_497_3");
    var R498_C3 = $("#64_1127_70017_498_3");
    var R499_C3 = $("#64_1127_70108_499_3");
    var R500_C3 = $("#64_1127_70121_500_3");
    var R501_C3 = $("#64_1127_70057_501_3");
    var R502_C3 = $("#64_1127_70038_502_3");
    var R503_C3 = $("#64_1127_70039_503_3");
    var R504_C3 = $("#64_1127_70122_504_3");
    var R505_C3 = $("#64_1127_70040_505_3");
    var R506_C3 = $("#64_1127_70018_506_3");
    var R507_C3 = $("#64_1127_70144_507_3");
    var R508_C3 = $("#64_1127_70041_508_3");
    var R509_C3 = $("#64_1127_69993_509_3");
    var R510_C3 = $("#64_1127_70109_510_3");
    var R511_C3 = $("#64_1127_70042_511_3");
    var R512_C3 = $("#64_1127_70043_512_3");
    var R513_C3 = $("#64_1127_70058_513_3");
    var R514_C3 = $("#64_1127_70019_514_3");
    var R515_C3 = $("#64_1127_70123_515_3");
    var R516_C3 = $("#64_1127_70124_516_3");
    var R517_C3 = $("#64_1127_70110_517_3");
    var R518_C3 = $("#64_1127_69994_518_3");
    var R519_C3 = $("#64_1127_70125_519_3");
    var R520_C3 = $("#64_1127_70145_520_3");
    var R521_C3 = $("#64_1127_70020_521_3");
    var R522_C3 = $("#64_1127_70084_522_3");
    var R523_C3 = $("#64_1127_69995_523_3");
    var R524_C3 = $("#64_1127_70044_524_3");
    var R525_C3 = $("#64_1127_70021_525_3");
    var R526_C3 = $("#64_1127_70111_526_3");
    var R527_C3 = $("#64_1127_70045_527_3");
    var R528_C3 = $("#64_1127_70059_528_3");
    var R529_C3 = $("#64_1127_70046_529_3");
    var R530_C3 = $("#64_1127_69996_530_3");
    var R531_C3 = $("#64_1127_70060_531_3");
    var R532_C3 = $("#64_1127_70126_532_3");
    var R533_C3 = $("#64_1127_70127_533_3");
    var R534_C3 = $("#64_1127_70146_534_3");
    var R535_C3 = $("#64_1127_69997_535_3");
    var R536_C3 = $("#64_1127_70022_536_3");
    var R537_C3 = $("#64_1127_70061_537_3");
    var R538_C3 = $("#64_1127_70062_538_3");
    var R539_C3 = $("#64_1127_70085_539_3");
    var R540_C3 = $("#64_1127_70086_540_3");
    var R541_C3 = $("#64_1127_70147_541_3");
    var R542_C3 = $("#64_1127_70148_542_3");
    var R543_C3 = $("#64_1127_69998_543_3");
    var R544_C3 = $("#64_1127_70047_544_3");
    var R545_C3 = $("#64_1127_70023_545_3");
    var R546_C3 = $("#64_1127_70048_546_3");
    var R547_C3 = $("#64_1127_70063_547_3");
    var R548_C3 = $("#64_1127_70128_548_3");
    var R549_C3 = $("#64_1127_70064_549_3");
    var R550_C3 = $("#64_1127_70129_550_3");
    var R551_C3 = $("#64_1127_70065_551_3");
    var R552_C3 = $("#64_1127_70024_552_3");
    var R553_C3 = $("#64_1127_70066_553_3");
    var R554_C3 = $("#64_1127_69999_554_3");
    var R555_C3 = $("#64_1127_70087_555_3");
    var R556_C3 = $("#64_1127_70088_556_3");
    var R557_C3 = $("#64_1127_70149_557_3");
    var R558_C3 = $("#64_1127_70089_558_3");
    var R559_C3 = $("#64_1127_70090_559_3");
    var R560_C3 = $("#64_1127_70130_560_3");
    var R561_C3 = $("#64_1127_70131_561_3");
    var R562_C3 = $("#64_1127_70025_562_3");
    var R563_C3 = $("#64_1127_70049_563_3");
    var R564_C3 = $("#64_1127_70026_564_3");
    var R565_C3 = $("#64_1127_70000_565_3");
    var R566_C3 = $("#64_1127_70091_566_3");
    var R567_C3 = $("#64_1127_70027_567_3");
    var R568_C3 = $("#64_1127_70001_568_3");
    var R569_C3 = $("#64_1127_70050_569_3");
    var R570_C3 = $("#64_1127_70067_570_3");
    var R571_C3 = $("#64_1127_70051_571_3");

    // Make specific fields read-only
    R400_C3.prop("readonly", true);

    // Calculate sum for R400_C3
    var values_R400_C3 = [

        parseFloat(R410_C3.val()) || 0.0,
        parseFloat(R411_C3.val()) || 0.0,
        parseFloat(R412_C3.val()) || 0.0,
        parseFloat(R413_C3.val()) || 0.0,
        parseFloat(R414_C3.val()) || 0.0,
        parseFloat(R415_C3.val()) || 0.0,
        parseFloat(R416_C3.val()) || 0.0,
        parseFloat(R417_C3.val()) || 0.0,
        parseFloat(R418_C3.val()) || 0.0,
        parseFloat(R419_C3.val()) || 0.0,
        parseFloat(R420_C3.val()) || 0.0,
        parseFloat(R421_C3.val()) || 0.0,
        parseFloat(R422_C3.val()) || 0.0,
        parseFloat(R423_C3.val()) || 0.0,
        parseFloat(R424_C3.val()) || 0.0,
        parseFloat(R425_C3.val()) || 0.0,
        parseFloat(R426_C3.val()) || 0.0,
        parseFloat(R427_C3.val()) || 0.0,
        parseFloat(R428_C3.val()) || 0.0,
        parseFloat(R429_C3.val()) || 0.0,
        parseFloat(R430_C3.val()) || 0.0,
        parseFloat(R431_C3.val()) || 0.0,
        parseFloat(R432_C3.val()) || 0.0,
        parseFloat(R433_C3.val()) || 0.0,
        parseFloat(R434_C3.val()) || 0.0,
        parseFloat(R435_C3.val()) || 0.0,
        parseFloat(R436_C3.val()) || 0.0,
        parseFloat(R437_C3.val()) || 0.0,
        parseFloat(R438_C3.val()) || 0.0,
        parseFloat(R439_C3.val()) || 0.0,
        parseFloat(R440_C3.val()) || 0.0,
        parseFloat(R441_C3.val()) || 0.0,
        parseFloat(R442_C3.val()) || 0.0,
        parseFloat(R443_C3.val()) || 0.0,
        parseFloat(R444_C3.val()) || 0.0,
        parseFloat(R445_C3.val()) || 0.0,
        parseFloat(R446_C3.val()) || 0.0,
        parseFloat(R447_C3.val()) || 0.0,
        parseFloat(R448_C3.val()) || 0.0,
        parseFloat(R449_C3.val()) || 0.0,
        parseFloat(R450_C3.val()) || 0.0,
        parseFloat(R451_C3.val()) || 0.0,
        parseFloat(R452_C3.val()) || 0.0,
        parseFloat(R453_C3.val()) || 0.0,
        parseFloat(R454_C3.val()) || 0.0,
        parseFloat(R455_C3.val()) || 0.0,
        parseFloat(R456_C3.val()) || 0.0,
        parseFloat(R457_C3.val()) || 0.0,
        parseFloat(R458_C3.val()) || 0.0,
        parseFloat(R459_C3.val()) || 0.0,
        parseFloat(R460_C3.val()) || 0.0,
        parseFloat(R461_C3.val()) || 0.0,
        parseFloat(R462_C3.val()) || 0.0,
        parseFloat(R463_C3.val()) || 0.0,
        parseFloat(R464_C3.val()) || 0.0,
        parseFloat(R465_C3.val()) || 0.0,
        parseFloat(R466_C3.val()) || 0.0,
        parseFloat(R467_C3.val()) || 0.0,
        parseFloat(R468_C3.val()) || 0.0,
        parseFloat(R469_C3.val()) || 0.0,
        parseFloat(R470_C3.val()) || 0.0,
        parseFloat(R471_C3.val()) || 0.0,
        parseFloat(R472_C3.val()) || 0.0,
        parseFloat(R473_C3.val()) || 0.0,
        parseFloat(R474_C3.val()) || 0.0,
        parseFloat(R475_C3.val()) || 0.0,
        parseFloat(R476_C3.val()) || 0.0,
        parseFloat(R477_C3.val()) || 0.0,
        parseFloat(R478_C3.val()) || 0.0,
        parseFloat(R479_C3.val()) || 0.0,
        parseFloat(R480_C3.val()) || 0.0,
        parseFloat(R481_C3.val()) || 0.0,
        parseFloat(R482_C3.val()) || 0.0,
        parseFloat(R483_C3.val()) || 0.0,
        parseFloat(R484_C3.val()) || 0.0,
        parseFloat(R485_C3.val()) || 0.0,
        parseFloat(R486_C3.val()) || 0.0,
        parseFloat(R487_C3.val()) || 0.0,
        parseFloat(R488_C3.val()) || 0.0,
        parseFloat(R489_C3.val()) || 0.0,
        parseFloat(R490_C3.val()) || 0.0,
        parseFloat(R491_C3.val()) || 0.0,
        parseFloat(R492_C3.val()) || 0.0,
        parseFloat(R493_C3.val()) || 0.0,
        parseFloat(R494_C3.val()) || 0.0,
        parseFloat(R495_C3.val()) || 0.0,
        parseFloat(R496_C3.val()) || 0.0,
        parseFloat(R497_C3.val()) || 0.0,
        parseFloat(R498_C3.val()) || 0.0,
        parseFloat(R499_C3.val()) || 0.0,
        parseFloat(R500_C3.val()) || 0.0,
        parseFloat(R501_C3.val()) || 0.0,
        parseFloat(R502_C3.val()) || 0.0,
        parseFloat(R503_C3.val()) || 0.0,
        parseFloat(R504_C3.val()) || 0.0,
        parseFloat(R505_C3.val()) || 0.0,
        parseFloat(R506_C3.val()) || 0.0,
        parseFloat(R507_C3.val()) || 0.0,
        parseFloat(R508_C3.val()) || 0.0,
        parseFloat(R509_C3.val()) || 0.0,
        parseFloat(R510_C3.val()) || 0.0,
        parseFloat(R511_C3.val()) || 0.0,
        parseFloat(R512_C3.val()) || 0.0,
        parseFloat(R513_C3.val()) || 0.0,
        parseFloat(R514_C3.val()) || 0.0,
        parseFloat(R515_C3.val()) || 0.0,
        parseFloat(R516_C3.val()) || 0.0,
        parseFloat(R517_C3.val()) || 0.0,
        parseFloat(R518_C3.val()) || 0.0,
        parseFloat(R519_C3.val()) || 0.0,
        parseFloat(R520_C3.val()) || 0.0,
        parseFloat(R521_C3.val()) || 0.0,
        parseFloat(R522_C3.val()) || 0.0,
        parseFloat(R523_C3.val()) || 0.0,
        parseFloat(R524_C3.val()) || 0.0,
        parseFloat(R525_C3.val()) || 0.0,
        parseFloat(R526_C3.val()) || 0.0,
        parseFloat(R527_C3.val()) || 0.0,
        parseFloat(R528_C3.val()) || 0.0,
        parseFloat(R529_C3.val()) || 0.0,
        parseFloat(R530_C3.val()) || 0.0,
        parseFloat(R531_C3.val()) || 0.0,
        parseFloat(R532_C3.val()) || 0.0,
        parseFloat(R533_C3.val()) || 0.0,
        parseFloat(R534_C3.val()) || 0.0,
        parseFloat(R535_C3.val()) || 0.0,
        parseFloat(R536_C3.val()) || 0.0,
        parseFloat(R537_C3.val()) || 0.0,
        parseFloat(R538_C3.val()) || 0.0,
        parseFloat(R539_C3.val()) || 0.0,
        parseFloat(R540_C3.val()) || 0.0,
        parseFloat(R541_C3.val()) || 0.0,
        parseFloat(R542_C3.val()) || 0.0,
        parseFloat(R543_C3.val()) || 0.0,
        parseFloat(R544_C3.val()) || 0.0,
        parseFloat(R545_C3.val()) || 0.0,
        parseFloat(R546_C3.val()) || 0.0,
        parseFloat(R547_C3.val()) || 0.0,
        parseFloat(R548_C3.val()) || 0.0,
        parseFloat(R549_C3.val()) || 0.0,
        parseFloat(R550_C3.val()) || 0.0,
        parseFloat(R551_C3.val()) || 0.0,
        parseFloat(R552_C3.val()) || 0.0,
        parseFloat(R553_C3.val()) || 0.0,
        parseFloat(R554_C3.val()) || 0.0,
        parseFloat(R555_C3.val()) || 0.0,
        parseFloat(R556_C3.val()) || 0.0,
        parseFloat(R557_C3.val()) || 0.0,
        parseFloat(R558_C3.val()) || 0.0,
        parseFloat(R559_C3.val()) || 0.0,
        parseFloat(R560_C3.val()) || 0.0,
        parseFloat(R561_C3.val()) || 0.0,
        parseFloat(R562_C3.val()) || 0.0,
        parseFloat(R563_C3.val()) || 0.0,
        parseFloat(R564_C3.val()) || 0.0,
        parseFloat(R565_C3.val()) || 0.0,
        parseFloat(R566_C3.val()) || 0.0,
        parseFloat(R567_C3.val()) || 0.0,
        parseFloat(R568_C3.val()) || 0.0,
        parseFloat(R569_C3.val()) || 0.0,
        parseFloat(R570_C3.val()) || 0.0,
        parseFloat(R571_C3.val()) || 0.0
    ];

    var sum_R400_C3 = values_R400_C3.reduce((acc, curr) => acc + curr, 0.0);
    R400_C3.val(sum_R400_C3 === 0 ? "" : sum_R400_C3.toFixed(1));
}
