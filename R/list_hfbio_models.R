# File: R/list_hfbio_models.R

#' List Available Hugging Face Models for Biological Analysis
#'
#' This function returns a curated list of models available on Hugging Face Hub
#' that are suitable for biological data analysis, including protein sequences,
#' histological images, and omics data.
#'
#' @param task Optional character string to filter models by task (e.g.,
#' "Protein Embedding").
#' @return A data.frame with information about available models.
#' @export
#'
#' @examples
#' models <- list_hfbio_models()
#' print(models)
#'
#' models_protein <- list_hfbio_models(task = "Protein Embedding")
#' print(models_protein)
list_hfbio_models <- function(task = NULL) {
    models <- data.frame(
        ModelName = c(
            "facebook/esm2_t33_650M_UR50D",
            "microsoft/BioViT",
            "intel/omics_transformer",
            "OpenProtein/openfold"
        ),
        Task = c(
            "Protein Embedding",
            "Histology Image Segmentation",
            "Omics Data Classification",
            "Protein Structure Prediction"
        ),
        HF_Repo = c(
            "https://huggingface.co/facebook/esm2_t33_650M_UR50D",
            "https://huggingface.co/microsoft/BioViT",
            "https://huggingface.co/intel/omics_transformer",
            "https://huggingface.co/OpenProtein/openfold"
        ),
        InputType = c(
            "Amino Acid Sequence",
            "Histological Image",
            "Omics Table",
            "Amino Acid Sequence"
        ),
        OutputType = c(
            "Embedding Vector",
            "Segmentation Map",
            "Classification Label",
            "3D Protein Structure"
        ),
        stringsAsFactors = FALSE
    )

    if (!is.null(task)) {
        models <- models[models$Task == task, , drop = FALSE]
    }

    return(models)
}
