import { TestAPI } from 'TestAPI';

test('testProtocolImplementation', () => {
    let a = new TestAPI.AProtocolImplementation(
        "Garply",
        false
    );
    expect(a.foo).toEqual("Garply");
    expect(a.baz).toEqual(false);

    let b = a.bar(2, 128);
    expect(b.foo).toEqual("130");
    expect(b.baz).toEqual(true)

    expect(a.hasADefaultImplementation?.(9, -102.1)).toEqual("-312 notBazzed");
    expect(a.hasADefaultImplementation?.(2, 0.345)).toEqual("bazzy 3");

    expect(a.hasADefaultImplementation2?.("923.2185", true, 0.0898714)).toEqual(3.7838466771424932E9);
    expect(a.hasADefaultImplementation2?.("923.2185", false, 0.0898714)).toEqual(1.9556754407899822E-5);

    expect(a.hasADefaultImplementation2?.("0.9870923", true, 1.123123)).toEqual(0.9589049888649063);
    expect(a.hasADefaultImplementation2?.("0.9870923", false, 1.123123)).toEqual(1.686253813623996);
});


test('testProtocolEnum', () => {
    TestAPI.TestProtocolEnum.foo("qux");
    expect(TestAPI.TestProtocolEnum.bar("qux")).toEqual(true);
    TestAPI.TestProtocolEnum.baz("qux", true);
    expect(TestAPI.TestProtocolEnum.garply("qux", "Navigate a nostril!")).toEqual("garply Navigate a nostril! garpity garp");
    expect(TestAPI.TestProtocolEnum.xyzzy("qux", 42, [1.234, 45.235890198, 892.80])).toEqual("thud: 42; grault: [1.234, 45.235890198, 892.8]");
    expect(TestAPI.TestProtocolEnum.plugh("qux", [true, 3.14159265359, ["Take a left at your intestines", "Take the second right past Mars"]])).toEqual([false, 3, "Take a left at your intestines -<*>- Take the second right past Mars"]);
});

test('testProtocolStruct', () => {
    let testProtocolStruct = new TestAPI.TestProtocolStruct("Raft a river of lava-ah!");
    expect(testProtocolStruct.corge).toEqual("Raft a river of lava-ah!");
    testProtocolStruct.corge = "Spank a plankton too! (take that)";
    expect(testProtocolStruct.corge).toEqual("Spank a plankton too! (take that)");
    expect(testProtocolStruct.frob).toEqual([3.14159265359, 42.0, -1.23456789]);
    expect(testProtocolStruct.plugh([true, 42.9, ["Ride on the magic school bus", "You might get baked into a pie"]])).toEqual([true, 51, "Ride on the magic school bus *>-<* You might get baked into a pie"]);
});
