#include "shared_impl.hpp"
namespace TestAPI {
    AttributedStringASDF::AttributeMergePolicy::AttributeMergePolicy(const std::variant<keepNew,keepCurrent> &_variant): _variant(_variant){}
}
