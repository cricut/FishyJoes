using System.Linq;
using Xunit;
using System.Collections.Generic;
using FluentAssertions;

namespace Cricut.TestAPI.Tests {
    [Collection("root")]
    public class CollectionTests {
        [Fact]
        void testCollectionValues() {
            Collections.ArrayOfInt.Should().BeEquivalentTo(new List<nint> { 2, 7, 3, 5, 8 });
            Collections.SetOfInt.Should().BeEquivalentTo(new HashSet<nint> { 5, 9, 2, 4, 3 });
            Collections.DictionaryOfIntToInt.Should().BeEquivalentTo(new Dictionary<nint, nint> { {1, 10}, {2, 20}, {3, 30}, {4, 40}, {5, 50} });
        }

        [Fact]
        void testOptionalCollectionValues() {
            Collections.MaybeArrayOfInt.Should().BeEquivalentTo(new List<nint> { 2, 7, 3, 5, 8 });
            Collections.MaybeSetOfInt.Should().BeEquivalentTo(new HashSet<nint> { 5, 9, 2, 4, 3 });
            Collections.MaybeDictionaryOfIntToInt?.Should().BeEquivalentTo(new Dictionary<nint, nint> { {1, 10}, {2, 20}, {3, 30}, {4, 40}, {5, 50} });
        }

        [Fact]
        void testOptionalCollectionOfOptionalValues() {
            Collections.MaybeArrayOfMaybeInt?.Equals(new List<nint?> {null, 2, 7, 3, 5, 8});
            Collections.MaybeSetOfMaybeInt?.Should().BeEquivalentTo(new HashSet<nint?> {null, 5, 9, 2, 4, 3});
            Collections.MaybeDictionaryOfIntToMaybeInt?.Should().BeEquivalentTo(new Dictionary<nint, nint?> { {100, null}, {1, 10}, {2, 20}, {3, 30}, {4, 40}, {5, 50} });
        }

        [Fact]
        void testFunctionsTakingAndReturningCollectionTypes() {
            Collections.EchoArrayOfInt(Collections.ArrayOfInt).Should().BeEquivalentTo(Collections.ArrayOfInt);
            Collections.EchoSetOfInt(Collections.SetOfInt).Should().BeEquivalentTo(Collections.SetOfInt);
            Collections.EchoDictionaryOfIntToInt(Collections.DictionaryOfIntToInt).Should().BeEquivalentTo(Collections.DictionaryOfIntToInt);
        }

        [Fact]
        void testFunctionsTakingAndReturningOptionalCollectionTypes() {
            Collections.EchoMaybeArrayOfMaybeInt(Collections.MaybeArrayOfMaybeInt)?.Should().BeEquivalentTo(Collections.MaybeArrayOfMaybeInt);
            Collections.EchoMaybeSetOfMaybeInt(Collections.MaybeSetOfMaybeInt).Should().BeEquivalentTo(Collections.MaybeSetOfMaybeInt);
            Collections.EchoMaybeDictionaryOfIntToMaybeInt(Collections.MaybeDictionaryOfIntToMaybeInt).Should().BeEquivalentTo(Collections.MaybeDictionaryOfIntToMaybeInt);
        }

        [Fact]
        void testFunctionsTakingClosuresWithCollectionTypes() {
            Collections.CollectionMapper(new List<nint?> { 10, 20, 30 }, it => new List<nint?>(it!.Select(it => it * 2)))
                .Should().BeEquivalentTo(new List<nint> { 20, 40, 60 });
        }

        [Fact]
        void testObjectsWithCollectionMembers() {
            Collections.CollectionHolder.StaticProperty.Should().BeEquivalentTo(new List<nint?> { null, 2, 7, 3, 5, 8 });
            Collections.CollectionHolder.StaticMutableProperty.Should().BeEquivalentTo(new List<nint?> { null, 2, 7, 3, 5, 8 });
            Collections.CollectionHolder.StaticMutableProperty = new List<nint?> { 100, null, 200 };
            Collections.CollectionHolder.StaticMutableProperty.Should().BeEquivalentTo(new List<nint?> { 100, null, 200 });
            var s = Collections.DefaultCollectionHolder;
            s.Should().BeEquivalentTo(Collections.DefaultCollectionHolder);
            s.BoolDictionary = new Dictionary<bool, bool>(s.BoolDictionary.Select(it => KeyValuePair.Create(it.Key, !it.Value)));
            s.Should().NotBeEquivalentTo(Collections.DefaultCollectionHolder);
        }
    }
}
