package com.cricut.fishyjoes.runtime

sealed class AttributeContainer:  {

}

sealed class AttributedString private constructor(swiftReference: Long): SwiftReference(swiftReference) {
    sealed class Index: Comparable<Index> {

    }

    sealed class UnicodeScalarView: List<UInt> {

    }

    sealed class CharacterView: Collection<String> {

    }

    sealed class Runs: Collection<Runs.Run> {
        data class Run(
            val attributes: Map<String, Any>,
            val range: SwiftRange<AttributedString.Index>
        )
    }

    val startIndex: Index = jni_startIndex()
    private external fun jni_startIndex(): Index

    val endIndex: Index = jni_endIndex()
    private external fun jni_endIndex(): Index

    val unicodeScalars: UnicodeScalarView = jni_unicodeScalars()
    private external fun jni_unicodeScalars(): UnicodeScalarView

    val characters: CharacterView = jni_characters()
    private external fun jni_characters(): CharacterView

    val runs: Runs = jni_runs()
    private external fun jni_runs(): Runs

    fun indexOffsetByUnicodeScalars(index: Index, offset: Int): Index {

    }

    fun indexOffsetByCharacters(index: Index, offset: Int): Index {

    }

    fun indexOffsetByRuns(index: Index, offset: Int): Index {

    }
}
