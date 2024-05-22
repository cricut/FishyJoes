import { TestAPI } from 'TestAPI';

const debugPrints = true;

test('testDefaultComputedPropertiesStruct', () => {
    const a = new TestAPI.TestDefaultComputedPropertiesStruct(
        true,
        98172
    );
    expect(a.spam).toEqual(true);
    expect(a.noot).toEqual(98172);
    expect(a.plutonic).toEqual("Newton Gimmick");
});

test('testProtocolImplementation', () => {
    const a = new TestAPI.AProtocolImplementation(
        "Garply",
        false
    );
    expect(a.foo).toEqual("Garply");
    expect(a.baz).toEqual(false);

    const b = a.bar(2, 128);
    expect(b.foo).toEqual("130");
    expect(b.baz).toEqual(true)

    expect(a.hasADefaultImplementation(9, -102.1)).toEqual("-312 notBazzed");
    expect(a.hasADefaultImplementation(2, 0.345)).toEqual("bazzy 3");

    expect(a.hasADefaultImplementation2("8", true, "0.0898714")).toEqual("826.0011614434572");
    expect(a.hasADefaultImplementation2("8", false, "0.0898714")).toEqual("1.9556754407899822e-05");

    expect(a.hasADefaultImplementation2("0.9870923", true, "1.123123")).toEqual("0.9589049888649063");
    expect(a.hasADefaultImplementation2("0.9870923", false, "1.123123")).toEqual("1.686253813623996");
});

test('testCore', () => {
    const coreObj: TestAPI.AProtocolCore = {
        baz: true,
        foo: "F005BA11",
        bar(x: number, y: number): TestAPI.AProtocol {
            return TestAPI.AProtocol.fromCore(new TestCoreClass(`${this.foo}+${x+y}`, x == 2));
        }
    };

    expect(coreObj.foo).toEqual("F005BA11")
    expect(coreObj.baz).toEqual(true)
    const obj = TestAPI.AProtocol.fromCore(coreObj);
    expect(obj.foo).toEqual("F005BA11")
    expect(obj.baz).toEqual(true)

    const barClass = obj.bar(78, 23);
    expect(barClass.foo).toEqual("F005BA11+101");
    expect(barClass.baz).toEqual(false);

    expect(obj.hasADefaultImplementation(9, -102.1)).toEqual("F005BA11+-312 notBazzed");
    expect(obj.hasADefaultImplementation(2, 0.345)).toEqual("bazzy F005BA11+3");

    expect(obj.hasADefaultImplementation2("923.2185", true, "0.0898714")).toEqual("3783846677.1424932");
    expect(obj.hasADefaultImplementation2("923.2185", false, "0.0898714")).toEqual("1.9556754407899822e-05");

    expect(obj.hasADefaultImplementation2("0.9870923", true, "1.123123")).toEqual("0.9589049888649063");
    expect(obj.hasADefaultImplementation2("0.9870923", false, "1.123123")).toEqual("1.686253813623996");

    const testCoreClass = new TestCoreClass("Gitang", false);
    const testClass = TestAPI.AProtocol.fromCore(testCoreClass);

    expect(testClass.foo).toEqual("Gitang");
    expect(testClass.baz).toEqual(false);
    const testClassBar = testClass.bar(-50, 55);
    expect(testClassBar.foo).toEqual("Garply");
    expect(testClassBar.baz).toEqual(true);

    expect(testClass.hasADefaultImplementation(9, -102.1)).toEqual("Garply notBazzed");
    expect(testClass.hasADefaultImplementation(2974, (-2969 / 3.14159265359))).toEqual("bazzy Garply");

    expect(testClass.hasADefaultImplementation2("923.2185", true, "0.0898714")).toEqual("928.2260565999999");
    expect(testClass.hasADefaultImplementation2("923.2185", false, "0.0898714")).toEqual("929.3260565999999");
});

class TestCoreClass implements TestAPI.AProtocolCore {
    constructor(foo: string, baz: boolean) {
        this.foo = foo;
        this.baz = baz;
    }
    baz: boolean;
    foo: string;
    bar(x: number, y: number): TestAPI.AProtocol {
        return new TestAPI.AProtocolImplementation(
            "Garply",
            (x + y) == 5
        );
    }

    hasADefaultImplementation2(a: string, b: boolean, c: string): string {
        return (Number(a) + (b ? 3.3 : 4.4) + (parseFloat(c) * 19)).toString();
    }
}

test('testProtocolEnum', () => {
    TestAPI.TestProtocolEnum.foo("qux");
    expect(TestAPI.TestProtocolEnum.bar("qux")).toEqual(true);
    TestAPI.TestProtocolEnum.baz("qux", true);
    expect(TestAPI.TestProtocolEnum.garply("qux", "Navigate a nostril!")).toEqual("garply Navigate a nostril! garpity garp");
    expect(TestAPI.TestProtocolEnum.xyzzy("qux", 42, [1.234, 45.235890198, 892.80])).toEqual("thud: 42; grault: [1.234, 45.235890198, 892.8]");
    expect(TestAPI.TestProtocolEnum.plugh("qux", [true, 3.14159265359, ["Take a left at your intestines", "Take the second right past Mars"]])).toEqual([false, 3, "Take a left at your intestines -<*>- Take the second right past Mars"]);
});

test('testProtocolStruct', () => {
    const testProtocolStruct = new TestAPI.TestProtocolStruct("Raft a river of lava-ah!");
    expect(testProtocolStruct.corge).toEqual("Raft a river of lava-ah!");
    testProtocolStruct.corge = "Spank a plankton too! (take that)";
    expect(testProtocolStruct.corge).toEqual("Spank a plankton too! (take that)");
    expect(testProtocolStruct.frobby).toEqual([3, 42, -1]);
    expect(testProtocolStruct.plugh([true, 42.9, ["Ride on the magic school bus", "You might get baked into a pie"]])).toEqual([true, 51, "Ride on the magic school bus *>-<* You might get baked into a pie"]);

    testProtocolStruct.foo();
    expect(testProtocolStruct.bar()).toEqual(false);
    testProtocolStruct.baz(true);
    expect(testProtocolStruct.garply("An octopus in your neighborhood?")).toEqual("garp garpity An octopus in your neighborhood? garpee");
    expect(testProtocolStruct.xyzzy(42, [1.234, 45.235890198, 892.80])).toEqual("thud: 42 | grault: [1.234, 45.235890198, 892.8]");
});

test('testProtocolClass', () => {
    const testProtocolClass = TestAPI.TestProtocolClass.init("Step inside it's a wilder ride!");
    expect(testProtocolClass.corge).toEqual("Step inside it's a wilder ride!");
    expect(testProtocolClass.frobby).toEqual([42, -1, 3]);
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
    const lups = new TestAPI.TestLeadingUnderscoredPropStruct("With great power comes great responsibility.");
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
            return `${await fn(1.0, 4.4, 2)}`;
        },
        async (fn) => {
            return `${await fn("Pump", "up", "the", "jam")}`;
        },
        async (fn) => {
            const y = await (await fn("78", 6, 4.2, "12", async () => { return 654; }))();
            return `${y}`;
        },
        async (fn) => {
            const y = await fn("78", 6, 4.2, "12", async () => { return 654; }, 98);
            return `${y}`;
        },
        (thunk) => {
            return async () => {
                await thunk();
                await thunk();
            };
        }
    )
}

function sleep(ms: number) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function testAsyncForeignSideFunctionsCore(a: TestAPI.TestAsyncFunctions) {
    expect(a.const42()).resolves.toEqual(49);
    expect(a.iabs(-2398)).resolves.toEqual(2398);
    const b = a.intCompose(
        async (x) => {
            sleep(1);
            return x * 3;
        },
        async (y) => {
            sleep(1);
            return y * 5;
        }
    );
    expect(b(92)).resolves.toEqual(1380);
    const d = a.makeList("By", "your", "powers", "combined");
    expect(d).resolves.toEqual(["By", "your", "powers", "combined"]);
    const e = await a.fifthThing(
        "I, am",
        (2 ** 32) - 1,
        -(2 ** 32),
        "Captain Planet!",
        async () => {
            sleep(1);
            return 42;
        }
    );
    expect(await e()).toEqual(42);
    const f = await a.six(
        "Big, bad",
        24,
        3.14159265359,
        "Beetleborgs",
        async () => {
            sleep(1);
            return 43;
        },
        -98237384
    );
    expect(f).toEqual(-98237384);

    expect(a.willThrow()).rejects.toThrowError("Spoon!")

    const g = await a.exercise0(e);
    expect(g).toEqual("84");
    const h = await a.exercise1(b);
    expect(h).toEqual("-105");

    const i = await a.exercise2(
        (a, b) => {
            return async (z) => {
                return (await a(3)) + (await b(3)) + z;
            }
        }
    );
    expect(i).toEqual("36");

    const j = await a.exercise3(
        async (fl, d, l) => {
            return (fl / d) + (9 * l);
        }
    );
    expect(j).toEqual("18.227272727272727");

    const k = await a.exercise4(
        async (a, b, c, d) => {
            return [d, c, b, a];
        }
    );
    expect(k).toEqual("jam,the,up,Pump");

    const l = await a.exercise5(
        async (a, b, c, d, e) => {
            return async () => {
                return Math.floor(Number(a) + Number(b) + c + Number(d) + (await e()));
            }
        }
    );
    expect(l).toEqual("754");

    const m = await a.exercise6(
        async (a, b, c, d, e, f) => {
            return Math.floor(Number(a) + Number(b) + c + Number(d) + (await e()) + f);
        }
    );
    expect(m).toEqual("852");

    let o = 1;
    const n = a.thunkTwiceMaker(
        async () => {
            o += 1;
            if (debugPrints) {
                console.log(`Thunker in paradise o: ${o}`);
            }
        }
    );
    await n();
    expect(o).toEqual(3);

    const p = await a.defaultExercise6(
        async (a, b, c, d, e, f) => {
            return Math.floor(Number(a) + Number(b) + c + Number(d) + (await e()) + f);
        }
    );
    expect(p).toEqual("962");
}

test('testAsyncForeignSideFunctions', async () => {
    const a = makeAsyncForeignSideFunction();
    await testAsyncForeignSideFunctionsCore(a);
});

test('testAsyncForeignSideFunctionsWitness', async () => {
    const _a = makeAsyncForeignSideFunction();
    const a = _a.witness()
    await testAsyncForeignSideFunctionsCore(a);
});

async function testAsyncSwiftSideFunctionsCore(a: TestAPI.TestAsyncFunctions) {
    expect(a.const42()).resolves.toEqual(42);
    expect(a.iabs(-2398)).resolves.toEqual(2398);
    const b = a.intCompose(
        async (x) => {
            sleep(1);
            return x * 3;
        },
        async (y) => {
            sleep(1);
            return y * 5;
        }
    );
    expect(b(92)).resolves.toEqual(1380);
    const d = a.makeList("By", "your", "powers", "combined");
    expect(d).resolves.toEqual(["By", "your", "powers", "combined"]);
    const e = await a.fifthThing(
        "I, am",
        (2 ** 32) - 1,
        -(2 ** 32),
        "Captain Planet!",
        async () => {
            sleep(1);
            return 42;
        }
    );
    expect(await e()).toEqual(42);
    const f = await a.six(
        "Big, bad",
        24,
        3.14159265359,
        "Beetleborgs",
        async () => {
            sleep(1);
            return 43;
        },
        -98237384
    );
    expect(f).toEqual(-98237384);

    expect(a.willThrow()).rejects.toThrowError(/TheAsyncError/)

    const g = await a.exercise0(e);
    expect(g).toEqual("42");
    const h = await a.exercise1(b);
    expect(h).toEqual("-45");

    const i = await a.exercise2(
        (a, b) => {
            return async (z) => {
                return (await a(3)) + (await b(3)) + z;
            }
        }
    );
    expect(i).toEqual("21");

    const j = await a.exercise3(
        async (fl, d, l) => {
            return (fl / d) + (9 * l);
        }
    );
    expect(j).toEqual("18.227272727272727");

    const k = await a.exercise4(
        async (a, b, c, d) => {
            return [d, c, b, a];
        }
    );
    expect(k).toEqual("[\"d\", \"c\", \"b\", \"a\"]");

    const l = await a.exercise5(
        async (a, b, c, d, e) => {
            return async () => {
                return Math.floor(Number(b) + c + (await e()));
            }
        }
    );
    expect(l).toEqual("93");

    const m = await a.exercise6(
        async (a, b, c, d, e, f) => {
            return Math.floor(Number(b) + c + (await e()) + f);
        }
    );
    expect(m).toEqual("135");

    let o = 3.14159265359;
    const n = a.thunkTwiceMaker(
        async () => {
            o = o * o;
            if (debugPrints) {
                console.log(`Thunkmaster thex o: ${o}`);
            }
        }
    );
    await n();
    expect(o).toEqual(97.4090910340281);

    const p = await a.defaultExercise6(
        async (a, b, c, d, e, f) => {
            return Math.floor(Number(a) + Number(b) + c + Number(d) + (await e()) + f);
        }
    );
    expect(p).toEqual("962");
}

test('testAsyncSwiftSideFunctions', async () => {
    const a = TestAPI.TestAsyncSwiftSideFunctionsClass.init();
    await testAsyncSwiftSideFunctionsCore(a);
});

test('testAsyncSwiftSideFunctionsWitness', async () => {
    const _a = TestAPI.TestAsyncSwiftSideFunctionsClass.init();
    const a = _a.witness()
    await testAsyncSwiftSideFunctionsCore(a);
});

class TestAsyncFunctionsImpl implements TestAPI.TestAsyncFunctionsCore {
    get const42(): () => Promise<number> {
        return async () => { return 49; };
    }
    get iabs(): (_0: number) => Promise<number> {
        return async (_0) => { return Math.abs(_0); }
    };
    get intCompose(): (_0: (_0: number) => Promise<number>, _1: (_0: number) => Promise<number>) => (_0: number) => Promise<number> {
        return (f, g) => {
            return async (x: number) => {
                return f(await g(x));
            }
        };
    };
    get add3Things(): (_0: number, _1: number, _2: number) => Promise<number> {
        return async (x, y, z) => {
            return x + y + z;
        }
    };
    get makeList(): (_0: string, _1: string, _2: string, _3: string) => Promise<string[]> {
        return async (a, b, c, d) => {
            return [a, b, c, d];
        }
    };
    get fifthThing(): (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>) => Promise<() => Promise<number>> {
        return async (a, b, c, d, e) => {
            return e;
        }
    };
    get six(): (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number> {
        return async (a, b, c, d, e, f) => {
            return f;
        }
    };
    get willThrow(): () => Promise<number> {
        return async () => {
            throw new Error("Spoon!");
        }
    };
    async exercise0(fn: () => Promise<number>): Promise<string> {
        return `${(await fn()) * 2}`;
    }
    async exercise1(fn: (_0: number) => Promise<number>): Promise<string> {
        return `${await fn(-7)}`;
    }
    async exercise2(fn: (_0: (_0: number) => Promise<number>, _1: (_0: number) => Promise<number>) => (_0: number) => Promise<number>): Promise<string> {
        return `${await fn(async (a) => { return a + 1; }, async (b) => { return b * 3; })(23)}`;
    }
    async exercise3(fn: (_0: number, _1: number, _2: number) => Promise<number>): Promise<string> {
        return `${await fn(1.0, 4.4, 2)}`;
    }
    async exercise4(fn: (_0: string, _1: string, _2: string, _3: string) => Promise<string[]>): Promise<string> {
        return `${await fn("Pump", "up", "the", "jam")}`;
    }
    async exercise5(fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>) => Promise<() => Promise<number>>): Promise<string> {
        const y = await (await fn("78", 6, 4.2, "12", async () => { return 654; }))();
        return `${y}`;
    }
    async exercise6(fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>): Promise<string> {
        const y = await fn("78", 6, 4.2, "12", async () => { return 654; }, 98);
        return `${y}`;
    }
    thunkTwiceMaker(thunk: () => Promise<void>): () => Promise<void> {
        return async () => {
            thunk();
            thunk();
        };
    }
    // defaultExercise6?(fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>): Promise<string> {
    //     throw new Error('Method not implemented.');
    // }
    witness(): TestAPI.TestAsyncFunctions {
        const a = new TestAsyncFunctionsImpl();
        return TestAPI.TestAsyncFunctions.fromCore(a);
    }    
}

test('testAsyncFunctionsImpl', async () => {
    const a = new TestAsyncFunctionsImpl();
    const b = TestAPI.TestAsyncFunctions.fromCore(a);
    await testAsyncForeignSideFunctionsCore(b);
});

test('testAsyncFunctionsImplWitness', async () => {
    const a = new TestAsyncFunctionsImpl();
    const b = TestAPI.TestAsyncFunctions.fromCore(a);
    const c = b.witness()
    await testAsyncForeignSideFunctionsCore(c);
});