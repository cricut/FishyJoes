using System;
using System.Linq;
using Xunit;
using Cricut.TestAPI;
using System.Collections.Generic;

namespace TestAPI.Tests {
    public class CollectionTests {
        [Fact]
        void testCollectionValues()
        {
            Assert.Equal(Collections.arrayOfInt, new nint[] { 2, 7, 3, 5, 8 });
            Assert.Equal(Collections.setOfInt, new HashSet<nint> { 5, 9, 2, 4, 3 });
            Assert.Equal(Collections.dictionaryOfIntToInt, new Dictionary<nint, nint> { {1, 10}, {2, 20}, {3, 30}, {4, 40}, {5, 50} });
        }

        [Fact]
        void testOptionalCollectionValues()
        {
            Assert.Equal(Collections.maybeArrayOfInt, new nint[] { 2, 7, 3, 5, 8 });
            Assert.Equal(Collections.maybeSetOfInt, new HashSet<nint> { 5, 9, 2, 4, 3 });
            Assert.Equal(Collections.maybeDictionaryOfIntToInt, new Dictionary<nint, nint> { {1, 10}, {2, 20}, {3, 30}, {4, 40}, {5, 50} });
        }

        [Fact]
        void testOptionalCollectionOfOptionalValues()
        {
            Assert.Equal(Collections.maybeArrayOfMaybeInt, new nint?[] {null, 2, 7, 3, 5, 8});
            Assert.Equal(Collections.maybeSetOfMaybeInt, new HashSet<nint?> {null, 5, 9, 2, 4, 3});
            Assert.Equal(Collections.maybeDictionaryOfIntToMaybeInt, new Dictionary<nint, nint?> { {100, null}, {1, 10}, {2, 20}, {3, 30}, {4, 40}, {5, 50} });
        }

        [Fact]
        void testVoidctionsTakingAndReturningCollectionTypes()
        {
            Assert.Equal(Collections.echoArrayOfInt(Collections.arrayOfInt), Collections.arrayOfInt);
            // TODO: Dies with: Wrong object class or methodID passed to JNI call
            //        Assert.Equal(Collections.echoSetOfInt(Collections.setOfInt), Collections.setOfInt);
            // TODO: Dies with: Wrong object class or methodID passed to JNI call
            //        Assert.Equal(Collections.echoDictionaryOfIntToInt(Collections.dictionaryOfIntToInt), Collections.dictionaryOfIntToInt);
    }

        [Fact]
        void testVoidctionsTakingAndReturningOptionalCollectionTypes()
        {
            Assert.Equal(Collections.echoMaybeArrayOfMaybeInt(Collections.maybeArrayOfMaybeInt), Collections.maybeArrayOfMaybeInt);
            // TODO: Dies with: Wrong object class or methodID passed to JNI call
            //        Assert.Equal(Collections.echoMaybeSetOfMaybeInt(Collections.maybeSetOfMaybeInt), Collections.maybeSetOfMaybeInt);
            // TODO: Dies with: Wrong object class or methodID passed to JNI call
            //        Assert.Equal(Collections.echoMaybeDictionaryOfMaybeIntToMaybeInt(Collections.maybeDictionaryOfMaybeIntToMaybeInt), Collections.maybeDictionaryOfMaybeIntToMaybeInt);
    }

        [Fact]
        void testVoidctionsTakingClosuresWithCollectionTypes()
        {
            // TODO: Fix breakage
            //        Assert.Equal(Collections.collectionMapper(arrayOf(10,20,30)) { (it ?: arrayOf()).map { it * 2 } }, arrayListOf(20,40,60));
        }

        [Fact]
        void testObjectsWithCollectionMembers()
        {
            Assert.Equal(Collections.CollectionHolder.staticPropery, new nint?[] { null, 2, 7, 3, 5, 8 });
            Assert.Equal(Collections.CollectionHolder.staticMutablePropery, new nint?[] { null, 2, 7, 3, 5, 8 });
            Collections.CollectionHolder.staticMutablePropery = new nint?[] { 100, null, 200 };
            Assert.Equal(Collections.CollectionHolder.staticMutablePropery, new nint?[] { 100, null, 200 });
            var s = Collections.defaultCollectionHolder;
            Assert.Equal(s, Collections.defaultCollectionHolder);
            s.boolDictionary = new Dictionary<bool, bool>(s.boolDictionary.Select(it => KeyValuePair.Create(it.Key, !it.Value)));
            Assert.NotEqual(s, Collections.defaultCollectionHolder);
        }
    }
}
