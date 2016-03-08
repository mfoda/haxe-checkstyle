package checks.design;

import checkstyle.checks.design.InterfaceIsTypeCheck;

class InterfaceIsTypeCheckTest extends CheckTestCase<InterfaceIsTypeCheckTests> {

	static inline var MSG:String = "Interfaces should describe a type and hence have methods";

	public function testWithJustVars() {
		assertMsg(new InterfaceIsTypeCheck(), TEST1, MSG);
	}

	public function testMarkerInterface() {
		assertNoMsg(new InterfaceIsTypeCheck(), TEST2);
	}

	public function testNoMarkerInterface() {
		var check = new InterfaceIsTypeCheck();
		check.allowMarkerInterfaces = false;
		assertMsg(check, TEST2, MSG);
	}

	public function testCorrectInterface() {
		assertNoMsg(new InterfaceIsTypeCheck(), TEST3);
	}
}

@:enum
abstract InterfaceIsTypeCheckTests(String) to String {
	var TEST1 = "
	interface IComponentController {
		var a:Int = 1;
	}";

	var TEST2 = "
	interface IComponentController {}";

	var TEST3 = "
	interface IComponentController {
		function init():Void;
	}";

	var TEST4 = "
	interface IComponentController {
		function init():Void;
	}";
}