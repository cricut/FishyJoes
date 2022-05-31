#pragma once
#include "TestAPI_pre.hpp"

namespace TestAPI {
    /// <!-- FishyJoes.exportReference(Functions) -->
    class Functions {
        /*  Inner Classes  */
        public:
        class TheError;
        /// <!-- FishyJoes.exportReference(Functions.TheError) -->
        class TheError {
            /*  Complete Constructor  */
            private:
            /// Create new TheError (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
            TheError(const FishyJoesInternal::SwiftReference &_ref);
            
            /*  Methods  */
            
            /*  Data  */
            private:
            /// Reference to Swift-managed data
            FishyJoesInternal::SwiftReference _ref;
            
            friend struct FishyJoesInternal::Packer;
            template <typename T> friend struct std::hash;
            template <typename T> friend struct std::equal_to;
        };
        
        /*  Complete Constructor  */
        private:
        /// Create new Functions (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
        Functions(const FishyJoesInternal::SwiftReference &_ref);
        
        /*  Methods  */
        public:
        /// <!-- FishyJoes.export(exercise0) -->
        static std::string exercise0(const std::function<int(> &fn);
        
        /// <!-- FishyJoes.export(exercise1) -->
        static std::string exercise1(const std::function<int(int> &fn);
        
        /// <!-- FishyJoes.export(exercise2) -->
        static std::string exercise2(const std::function<std::function<int(int>(std::function<int(int>, std::function<int(int>> &fn);
        
        /// <!-- FishyJoes.export(exercise3) -->
        static std::string exercise3(const std::function<double(float, double, int> &fn);
        
        /// <!-- FishyJoes.export(exercise4) -->
        static std::string exercise4(const std::function<std::vector<std::string>(std::string, std::string, std::string, std::string> &fn);
        
        /// <!-- FishyJoes.export(exercise5) -->
        static std::string exercise5(const std::function<std::function<int(>(std::string, int, double, std::string, std::function<int(>> &fn);
        
        /// <!-- FishyJoes.export(exercise6) -->
        static std::string exercise6(const std::function<int(std::string, int, double, std::string, std::function<int(>, int> &fn);
        
        /// <!-- FishyJoes.export(willThrow) -->
        static std::string willThrow();
        
        /// <!-- FishyJoes.export(const42) -->
        static std::function<int(> getConst42();
        
        /// <!-- FishyJoes.export(abs) -->
        static std::function<int(int> getIabs();
        
        /// <!-- FishyJoes.export(intCompose) -->
        static std::function<std::function<int(int>(std::function<int(int>, std::function<int(int>> getIntCompose();
        
        /// <!-- FishyJoes.export(add3Things) -->
        static std::function<double(float, double, int> getAdd3Things();
        
        /// <!-- FishyJoes.export(makeList) -->
        static std::function<std::vector<std::string>(std::string, std::string, std::string, std::string> getMakeList();
        
        /// <!-- FishyJoes.export(fifthThing) -->
        static std::function<std::function<int(>(std::string, int, double, std::string, std::function<int(>> getFifthThing();
        
        /// <!-- FishyJoes.export(sixthThing) -->
        static std::function<int(std::string, int, double, std::string, std::function<int(>, int> getSix();
        
        
        /*  Data  */
        private:
        /// Reference to Swift-managed data
        FishyJoesInternal::SwiftReference _ref;
        
        friend struct FishyJoesInternal::Packer;
        template <typename T> friend struct std::hash;
        template <typename T> friend struct std::equal_to;
    };
}
