#pragma once
#include "TestAPI_pre.hpp"

namespace TestAPI {
    /// <!-- FishyJoes.exportReference(Strings) -->
    class Strings {
        /*  Complete Constructor  */
        private:
        /// Create new Strings (only to be used by FishyJoes internally. Look for static methods for initialization or other public constructors.)
        Strings(const FishyJoesInternal::SwiftReference &_ref);
        
        /*  Methods  */
        public:
        /// <!-- FishyJoes.export(echo) -->
        static std::string echo(const std::string &string);
        
        /// <!-- FishyJoes.export(simple) -->
        static std::string getSimple();
        
        /// <!-- FishyJoes.export(accent) -->
        static std::string getAccent();
        
        /// <!-- FishyJoes.export(script) -->
        static std::string getScript();
        
        /// <!-- FishyJoes.export(chinese) -->
        static std::string getChinese();
        
        /// <!-- FishyJoes.export(chineseBMP) -->
        static std::string getChineseBMP();
        
        /// <!-- FishyJoes.export(chineseSIP) -->
        static std::string getChineseSIP();
        
        /// <!-- FishyJoes.export(emoji) -->
        static std::string getEmoji();
        
        /// <!-- FishyJoes.export(emojiMulti) -->
        static std::string getEmojiMulti();
        
        
        /*  Data  */
        private:
        /// Reference to Swift-managed data
        FishyJoesInternal::SwiftReference _ref;
        
        friend struct FishyJoesInternal::Packer;
        template <typename T> friend struct std::hash;
        template <typename T> friend struct std::equal_to;
    };
}
