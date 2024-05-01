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

    testProtocolStruct.foo();
    expect(testProtocolStruct.bar()).toEqual(false);
    testProtocolStruct.baz(true);
    expect(testProtocolStruct.garply("An octopus in your neighborhood?")).toEqual("garp garpity An octopus in your neighborhood? garpee");
    expect(testProtocolStruct.xyzzy(42, [1.234, 45.235890198, 892.80])).toEqual("thud: 42 | grault: [1.234, 45.235890198, 892.8]");
});

test('testProtocolClass', () => {
    let testProtocolClass = TestAPI.TestProtocolClass.init("Step inside it's a wilder ride!");
    expect(testProtocolClass.corge).toEqual("Step inside it's a wilder ride!");
    expect(testProtocolClass.frob).toEqual([42.0, -1.23456789, 3.14159265359]);
    expect(testProtocolClass.flarp).toEqual(undefined);
    testProtocolClass.flarp = "Excellent observation Kiki!";
    expect(testProtocolClass.flarp).toEqual("Excellent observation Kiki!");
    expect(testProtocolClass.wombat(undefined)).toEqual(42.909);
    expect(testProtocolClass.wombat(57)).toEqual(undefined);
    expect(testProtocolClass.wombat(56)).toEqual(7890.2);

    expect(testProtocolClass.spqr(new TestAPI.AssociatedDataEnum.Thing(23947889))).toEqual(23947889);
    expect(testProtocolClass.spqr(new TestAPI.AssociatedDataEnum.Other("zxc", 89708973))).toEqual(89708973);
    expect(testProtocolClass.spqr(new TestAPI.AssociatedDataEnum.Bar("shme", new TestAPI.AssociatedDataEnum.NoValue()))).toEqual(45);
    expect(testProtocolClass.spqr(new TestAPI.AssociatedDataEnum.NoValue())).toEqual(42);
    expect(testProtocolClass.spqr(new TestAPI.AssociatedDataEnum.SimpleEnum("blue"))).toEqual(1);

    testProtocolClass.foo();
    expect(testProtocolClass.bar()).toEqual(true);
    testProtocolClass.baz(false);
    expect(testProtocolClass.garply("Surfin' on a sine wave")).toEqual("garplify Surfin' on a sine wave parguino");
    expect(testProtocolClass.xyzzy(42, [1.234, 45.235890198, 892.80])).toEqual("thud: 42 \\|/ grault: [1.234, 45.235890198, 892.8]");
    expect(testProtocolClass.plugh([true, 92.47, ["Please let this be a normal field trip", "I knew I should've stayed home today"]])).toEqual([true, 83, "Please let this be a normal field trip _-^= I knew I should've stayed home today"]);
});

test('testLeadingUnderscoreInNames', () => {
    let lups = new TestAPI.TestLeadingUnderscoredPropStruct("With great power comes great responsibility.");
    expect(lups._leadingUnderscoreProp).toEqual("With great power comes great responsibility.");
});

function makeAsyncForeignSideFunction() {
    return new TestAPI.TestAsyncForeignSideFunctionsStruct(
        async () => { return 49; },
        async (_0) => { return Math.abs(_0); },
        (f, g) => {
            return async (x: number) => {
                return f(await g(x));
            }
        },
        async (x, y, z) => {
            return x + y + z;
        },
        async (a, b, c, d) => {
            return [a, b, c, d];
        },
        async (a, b, c, d, e) => {
            return e;
        },
        async (a, b, c, d, e, f) => {
            return f;
        },
        async () => {
            throw new Error("Spoon!");
        },
        async (fn) => {
            return `${await fn() * 2}`;
        },
        async (fn) => {
            return `${await fn(-7)}`;
        },
        async (fn) => {
            return `${await fn(async (a) => { return a + 1; }, async (b) => { return b * 3; })(23)}`;
        },
        async (fn) => {
            return `${await fn(1.0, 4.4, 3)}`;
        },
        async (fn) => {
            return `${await fn("Pump", "up", "the", "jam")}`;
        },
        async (fn) => {
            let y = await (await fn("78", 6, 4.2, "12", async () => { return 654; }))();
            return `${y}`;
        },
        async (fn) => {
            let y = await fn("78", 6, 4.2, "12", async () => { return 654; }, 98);
            return `${y}`;
        },
        (thunk) => {
            return async () => {
                thunk();
                thunk();
            };
        }
    )
}

function testAsyncForeignSideFunctionsCore(a: TestAPI.TestAsyncFunctions) {
    expect(a.const42()).resolves.toEqual(49);
}

test('testAsyncForeignSideFunctions', () => {
    let a = makeAsyncForeignSideFunction();
    testAsyncForeignSideFunctionsCore(a);
});

test('testAsyncForeignSideFunctions', () => {
    let _a = makeAsyncForeignSideFunction();
    let a = _a.witness()
    testAsyncForeignSideFunctionsCore(a);
});