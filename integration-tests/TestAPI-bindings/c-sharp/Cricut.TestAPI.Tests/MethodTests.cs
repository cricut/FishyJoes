using System;
using Xunit;

namespace Cricut.TestAPI.Tests {
    public class MethodTests {
        [Fact]
        void testStaticMethods() {
            Assert.Equal(123, Methods.GetStaticGet());
            Assert.Equal(234, Methods.GetStaticGetMethod());

            Assert.Equal(345, Methods.GetStaticModifiable());
            Methods.SetStaticModifiable(987);
            Assert.Equal(987, Methods.GetStaticModifiable());

            Assert.Equal(567, Methods.StaticStored);
            Methods.StaticStored = 765;
            Assert.Equal(765, Methods.StaticStored);
        }

        [Fact]
        void testInstanceMethods() {
            var instance = Methods.Create();

            Assert.Equal(1234, instance.GetInstanceGet());
            Assert.Equal(2345, instance.GetInstanceGetMethod());

            Assert.Equal(3456, instance.GetInstanceModifiable());
            instance.SetInstanceModifiable(9876);
            Assert.Equal(9876, instance.GetInstanceModifiable());

            Assert.Equal(5678, instance.InstanceStored);
            instance.InstanceStored = 7654;
            Assert.Equal(7654, instance.InstanceStored);
        }
    }
}