// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import "../src/ClaimSystem.sol";
import "../src/examples/VerifyClaim.sol";
import "../src/examples/plonk_vk.sol";

contract VerifyClaimScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;

        vm.startBroadcast(deployerPrivateKey);

        address verifier = address(new UltraVerifier());

        VerifyClaim verifyAdressIsHumanClaim = new VerifyClaim(verifier);

        ClaimSystem claimSystem = new ClaimSystem();

        claimSystem.setType(2, address(verifyAdressIsHumanClaim));
        claimSystem.setTrustHash(2, bytes32(0x0b7ce38eae5d7d171103b2879399856eedfacf71a862c7a89ca80a0f03e3be1c));

        bytes memory proof =  hex"230da9f285ee839215ed57543f7d282fd5a7713ffcf8c46ccdcb08eabf467fa91b95992ce0c9091dcc03d88300e6f58a90b586a113c1c11e33cb346049d425c0142f8ee7fce8acce3bfb4fbbc1a9cb9eff80a0c34442e837127d4a10546d2aee05783211485cec7f7f1953ebfab1516874b5bb44e74323e22b24abcf192eadd10e6f8da26da0d28bd5a6703f57a1cb41a7ecc6ce0c87c262808d23f07beec4082354a3052abeec949b428dc0581e27f51edda8a97beffb60fa37a30a05e6a916075850b04b2dfe83feef48c20a8a4c48a8cf2dac3ec08a703d348b48ec44321520d0656e7cfe6da4d27c0f4dd02678f24612a664d1c26324a6b3d289923ce46917291ac43ceed4106e4431759ae9c3ac6cb999390e91cfe8f895d1b9ee0ab30e26ec8bd37228d097230f9d1f0d7080fd4d840828134ca9f27636ce5cfca98c360f4f3d16b7689e6b096fac4ce12fec21e21eca14381438984e574e058b9dc5700f83cdf89c3d2c5063545d4e2b347e7dba17ed4dd17b40f328652be07dd1d42502860b37f09aee115b1baf193f9755e4a6bcb2c0ac0cacac1a75ff08e1103ef114cb89398956ecf9cd527cac69f31f9cf7c8388474d92cbd13ac34176e94353907f5a1b7f78b9eaf28065f7fe84aab4dda0a1a41750b95d357987ca9ae37fb660bf269681f7417346005f0c3c9863f89d7890c1786e718e68dc2e4f04743363c01138b71aa02f1ced99264cb82fc1e8799c0deb1a3c18ea4eab3f2aceaa2ebfe1ebda77377c39d0d5beb31368400e0b82592d12020a4289ddd541996fc0748dd28d2e5e192e210fb27c5ee8fffac2aeed1c953d3bc51ab8c9e7667bd19224d7724edff91ad40bc2d7adb9090e99a8231cc412be82c52b8de0eb1865f178fac350b053d506812e5a35ab257ef25a47eab91e2cff88c3b1c93605f195ad36b781f2575334e36d5dc66699195e25a65655a726b953529655297b6a72b5a95400844131e63f947d5aacc0acdfd542cf7e90916bb258778d414c1388423f1f2a57a462075bad986bcb65090c6a872f531b1aef49f2ae05bcc540f5eefcd80c6e3a3242e77919f24b43d7bb50ad4b04151d2fb4d743a567b97f6dc4ab9fd8e0c0452092e045561bcecf402f26a0039844df0a615f2fab5fd75d88b4b499e7ceb50a1b500d1dfcb953127dc131dc618b0f12a048dbe6ba8871550d4a112cebca9f737151d18a78d7a440a70954045bd9f048a0104b5dead3ec3c3540e10ce3037bff588165f41f908f7b981c1ea37e6be1caad48856f9defb55b194c3ea6df0776eee371f5345be511916d71e68a253f4e3e0c6e657a90e0807f9c748c2c3718de9a74019afb404e990a2f8373ee67204a53e2c1fcb802a6870e87cfe46ec1f43557ddd1bb1501f3a6ed6c400f8cd6a48b2a25ee4d610fe5495e0b04ba43e74be0f75aa243a94e4652f6f316427b5728f1ed7adc35b682df7161a5f0942644d139fbe251f2ae261b48b3b9d507458aa58cbe7c811d05cc59c60d3e81dc6b42547c48dd004e1315c35e1b1de46527ab76df1733490168654e0d897b9071e160e148e850f19e0b045ec18d6e1020120dce0fbd82e14af454d7efafe2bb6f84acf59d6e3e409cd44a73481d7b45d2da73a8232ee1f2b2151ff633f09e8834ad118cfc953152088a1e2d5cce3f25d7d77f72d9807a812ee9e530ae2257aa12c04587fe0adb82ffda570018a9d9f31d04f6c409c11aeeaf2af6b6517b1905fdbf376216001570c3a1fa969ac6d774a682ba44f386ee3786343c7fb9b9f83ce6f132d7bd6c7e0114f52a0a3280e0c06df59bc6f2a9a657bc2237ba4072cc30f92f4a6ea4f8cd6138b9ef50d026f094ca5eb1c125c46946b0dbc8bbd927117f4cd00010434508503e28cdff2e6f189afbf9e2eac50725c20704ed79ff7a1cd694aabb81263321407362c21f1ace99c9f95f1546006c560ae6c33c620dc8a49f7e4e7585c437d331bfda932aa934bf6051863354cdaeec500bd88f26e0378c3a77fe4656f10e1a01bbe9b338e1433996ef4d64c3bd91387602e5a07b52bda3d9707ae6e51a1e6080b22c5017ad7215984e3017a32056fa125d8c4512425dd0bf8cfc796235d373d14ca2c490346400b8899006bf01bf8dde77e753cf8a1500905fe9750ed94e33422fbed755772a9ac7f6506bb127684ba99087dde3fb1700648a256b02ba10402006aff1f5ad7cab124784a37e8a77ce354c1da46006b458e28a53d2db36607ca1fcb1c9a7fd16868e32e61305212ed5369edfe1ca515e64fd9e8879a0797d7cb2fe4b97194c89637b4c2c1c4effa523dab48fc3bf3b3848ecd53fa4c89b3952e10a4bf25b9c22842287f07ee8d724fc40c948e71eaad9d2f3e708e5b40b52a8e0efbbcdc139d4b6371c2c6ebbbfeb7cb2edda4fabb381406e284361249aca565147705c9202eb655640f120b6e878ce99d13ca1713c5c9731f9ce651af5edc6119da9ae97dc0e18acd34a5498d5511646a74b515fcf74da2e9cc1c9f4dd19e8516d299c3d0135cc8dccb8089753e63ba2e8687c712c9f4c1cf6549b71c7cc955208637dbea9ecb93f4d011929ca1fe50585d8256914658684dfef662eb2a98660b8925436c0a32c73be6e9edc245b2b4097c0bef6aca5dc501139062e591b46116e875297f0589796ce56801270f591886fd2f3e2b6262fe247b94aed621323d09360f7d1af0291401ee169e7484ea3c904e0d0e4586b4715b3d2a4814fe908f0806f9b489cf79233b75b4e696ea57d7e69a4fe5f52dbad0a00ea7efb8c125940c047f43b4c17aa793d0f9da516b99dbfe4a734f285242e97036baea15a38b612ef740260e2b2d65b7a848e84eb5acd3cf9105bd8812df1e113b4eefa535aa3f0b89199ca625ee524897fd2669de9868c4d4fc959348ae0184ae983515da7e5314bde52bc16cb67dd276cd98bf17bac8b48ccbdabeac27db79b591f9fae744fe1e51e0c7e4a3363fcceda98582e1392052d790cc5a4ad91f08272e551cfb5166";
        bytes32[] memory morePublicInput;

        claimSystem.claim(
            proof,
            1742878483,
            2,
            2,
            morePublicInput
        );

        vm.stopBroadcast();
    }
}