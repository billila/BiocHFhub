#' Summarize Hugging Face Model Parameters
#'
#' This function summarizes key architectural parameters of a biological model
#' retrieved from Hugging Face Hub.
#'
#' @param params A list of model parameters, as returned by
#' get_hfbio_model_parameters().
#' @return A character string summarizing the model's architecture.
#' @export
#'
#' @examples
#' params <- get_hfbio_model_parameters("facebook/esm2_t33_650M_UR50D")
#' summarize_hfbio_model(params)
summarize_hfbio_model <- function(params) {
    model <- if (!is.null(params$architectures)) params$architectures[1]
    else "Unknown"
    hidden_size <- if (!is.null(params$hidden_size)) params$hidden_size
    else NA
    attention_heads <- if (!is.null(params$num_attention_heads))
        params$num_attention_heads else NA
    hidden_layers <- if (!is.null(params$num_hidden_layers))
        params$num_hidden_layers else NA
    vocab_size <- if (!is.null(params$vocab_size))
        params$vocab_size else NA
    max_seq_length <- if (!is.null(params$max_position_embeddings))
        params$max_position_embeddings else NA

cat(
        "Model: ", model, "\n",
        "Layers: ", hidden_layers, "\n",
        "Hidden size: ", hidden_size, "\n",
        "Attention heads: ", attention_heads, "\n",
        "Embedding size: ", vocab_size, " tokens\n",
        "Max sequence length: ", max_seq_length, "\n",
        sep = ""
    )

    invisible(NULL)
}
