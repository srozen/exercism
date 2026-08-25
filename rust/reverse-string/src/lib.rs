// use unicode_segmentation::UnicodeSegmentation;

pub fn reverse(input: &str) -> String {
    input.chars().rev().collect() // Standard Way

    // Naive version with multiple memory allocation
    // input.graphemes(true).rev().collect()

    // Efficient Grapheme based version
    // let mut out = String::with_capacity(input.len());
    // out.extend(input.graphemes(true).rev());
    // out
}
