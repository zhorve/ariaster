#' Complete list of palettes
#'
#' Use \code{\link{ari_palette}} to construct palettes of desired length.
#'
#' @export
ari_palettes <- list(
  Hereditary1 = c("#EBAB87", "#EC9C39", "#A66329", "#A64521", "#592411"),
  Hereditary2 = c("#4a4732","#4f6e56","#ad994a","#8c4545","#2b4a55", "#6d505a"),
  Hereditary3 = c("#122627", "#416048", "#F2E963", "#D9851E", "#523215"),
  Hereditary4 = c("#8C2920", "#D76334", "#364F28", "#7C9118", "#B68A63"),

  Midsommar1 = c("#CB0100", "#7AB53D", "#F9CB00", "#F66A0B", "#1C47B7","#DD0489"),
  Midsommar2 = c("#EFBB29", "#FF5E2A", "#D42A1D", "#9B1F17", "#401111"),
  Midsommar3 = c("#766FA6", "#8594A9", "#4F686B", "#AD8A2A", "#C1BCB2"),
  Midsommar4 = c("#4679A6", "#BFCDD0", "#86816B", "#AA7C6C", "#36312D"),

  Beau1 = c("#0B0560", "#4C7AAD", "#D6B575", "#F27405", "#A5120F"),
  Beau2 = c("#BDD3E0", "#324001", "#808C23", "#B8BF7E", "#D92B04"),
  Beau3 = c("#9B2E35", "#387148", "#114C89", "#CAB851", "#8B4928"),
  BeauMonster = c("#F2EB85", "#625125", "#D9C0BA", "#402A2D", "#0D0D0D"),

  Eddington1 = c("#485249", "#6E705A", "#D3C598", "#D98346", "#D93720"),
  Eddington2 = c("#779C95", "#3B5355", "#A97162", "#73392C", "#736D68"),
  Eddington3 = c("#0477BF", "#F20505", "#6A152C", "#137850", "#6F4106")
)

#' An Ari Aster palette generator
#'
#' These are a handful of color palettes inspired by Ari Aster films.
#'
#' @param n Number of colors desired. Most palettes have 5 or 6 colors.
#'   If omitted, uses all colours.
#' @param name Name of desired palette. Choices are:
#'   \code{Heriditary1}, \code{Heriditary2}, \code{Heridtary3}, \code{Heridtary4},
#'   \code{Midsommar1}, \code{Midsommar2}, \code{Midsommar3}, \code{Midsommar4},
#'   \code{Beau1}, \code{Beau2}, \code{Beau3}, \code{BeauMonster},
#'   \code{Eddington1}, \code{Eddington2}, \code{Eddington3},
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#' @importFrom graphics rgb rect par image text
#' @return A vector of colours.
#' @export
#' @keywords colors
#' @examples
#' ari_palette("Hereditary1")
#' ari_palette("Midsommar2")
#' ari_palette("Beau3")
#' ari_palette("Midsommar1", 3)
#'
#' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- ari_palette(21, name = "Hereditary2", type = "continuous")
#' image(volcano, col = pal)
ari_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  pal <- ari_palettes[[name]]

  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }

  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' @keywords internal
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
#' @export
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}

#' Test a palette with example visualizations
#'
#' Generates four example plots using fake data to preview how a palette
#' looks across common chart types: a heatmap, pie chart, scatterplot
#' (colored by category), and a paired boxplot.
#'
#' @importFrom grDevices rgb colorRampPalette
#' @importFrom graphics par image rect text abline boxplot legend pie
#' @importFrom stats rnorm
#' @param name Name of desired palette from \code{\link{ari_palettes}}.
#' @param n Number of colors to use. If omitted, uses all colors in the palette.
#'
#' @return Invisibly returns the palette vector. Called for its side effect of
#'   producing plots.
#' @export
#' @examples
#' test_palette("Midsommar1")
#' test_palette("Hereditary2", n = 4)
test_palette <- function(name, n) {

  # --- Build palette ---
  pal <- ari_palettes[[name]]
  if (is.null(pal)) stop("Palette not found.")
  if (missing(n)) n <- length(pal)
  if (n > length(pal)) stop("Number of requested colors greater than what palette can offer.")
  pal <- pal[1:n]

  # --- Layout: 2x2 grid ---
  old_par <- par(mfrow = c(2, 2), mar = c(4, 4, 3, 1))
  on.exit(par(old_par))

  # ---- 1. Heatmap ----
  heat_colors <- grDevices::colorRampPalette(pal)(100)
  heat_data   <- outer(
    seq(-2, 2, length.out = 20),
    seq(-2, 2, length.out = 20),
    function(x, y) exp(-((x - 2)^2 + (y - 2)^2) / 18)
  ) + matrix(rnorm(400, sd = 0.05), nrow = 20)
  image(
    heat_data,
    col  = heat_colors,
    xaxt = "n", yaxt = "n",
    xlab = "", ylab = "",
    main = paste0(name, " - Heatmap")
  )

  # ---- 2. Pie chart ----
  pie_vals    <- c(28, 22, 19, 16, 15, 12)[1:n]
  pie_labels  <- paste0("Group ", LETTERS[1:n])
  pie(
    pie_vals,
    labels = pie_labels,
    col    = pal,
    main   = paste0(name, " - Pie Chart"),
    border = "white"
  )

  # ---- 3. Scatterplot colored by category ----
  set.seed(7)
  cats        <- rep(1:n, each = 20)
  scatter_x   <- rnorm(n * 20, mean = cats * 2)
  scatter_y   <- rnorm(n * 20, mean = cats + sin(cats))
  plot(
    scatter_x, scatter_y,
    col  = pal[cats],
    pch  = 19,
    xlab = "X", ylab = "Y",
    main = paste0(name, " - Scatterplot"),
    bty  = "l"
  )
  legend(
    "topleft",
    legend = paste0("Cat ", 1:n),
    col    = pal,
    pch    = 19,
    bty    = "n",
    cex    = 0.8
  )

  # ---- 4. Paired boxplot (2 pairs + 1 extra) ----
  # Uses first 5 colors; if palette has fewer, cycles gracefully
  box_cols <- rep_len(pal, 5)
  set.seed(21)
  box_data <- list(
    "A1" = rnorm(30, mean = 5.0),
    "A2" = rnorm(30, mean = 6.5),
    "B1" = rnorm(30, mean = 3.5),
    "B2" = rnorm(30, mean = 5.0),
    "C"  = rnorm(30, mean = 7.0)
  )
  boxplot(
    box_data,
    col    = box_cols,
    border = "#333333",
    main   = paste0(name, " - Boxplot"),
    xlab   = "Group", ylab   = "Value",
    bty    = "l",
    names  = names(box_data)
  )
  # Dividers between pairs
  abline(v = 2.5, lty = 2, col = "grey60")
  abline(v = 4.5, lty = 2, col = "grey60")

  invisible(pal)
}

.onLoad <- function(libname, pkgname) {
  registerS3method("print", "palette", print.palette)
}
