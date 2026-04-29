<!-- README.md is generated from README.Rmd. Please edit that file -->

# Ari Aster Palettes

Color palettes inspired by the films of Ari Aster. Each palette is drawn
from the distinct visual language of *Hereditary*, *Midsommar*, *Beau Is
Afraid*, and *Eddington*.

## Installation

``` r
# Development version
devtools::install_github("yourusername/aripalettes")
```

## Usage

``` r
library("ariaster")

# See all palettes
names(ari_palettes)
#>  [1] "Hereditary1" "Hereditary2" "Hereditary3" "Hereditary4" "Midsommar1" 
#>  [6] "Midsommar2"  "Midsommar3"  "Midsommar4"  "Beau1"       "Beau2"      
#> [11] "Beau3"       "BeauMonster" "Eddington1"  "Eddington2"  "Eddington3"
```

## Palettes

### Hereditary (2018)

``` r
ari_palette("Hereditary1")
#> [1] "#EBAB87" "#EC9C39" "#A66329" "#A64521" "#592411"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "Hereditary1"
ari_palette("Hereditary2")
#> [1] "#4a4732" "#4f6e56" "#ad994a" "#8c4545" "#2b4a55" "#6d505a"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "Hereditary2"
ari_palette("Hereditary3")
#> [1] "#122627" "#416048" "#F2E963" "#D9851E" "#523215"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "Hereditary3"
ari_palette("Hereditary4")
#> [1] "#8C2920" "#D76334" "#364F28" "#7C9118" "#B68A63"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "Hereditary4"
```

### Midsommar (2019)

``` r
ari_palette("Midsommar1")
#> [1] "#CB0100" "#7AB53D" "#F9CB00" "#F66A0B" "#1C47B7" "#DD0489"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "Midsommar1"
ari_palette("Midsommar2")
#> [1] "#EFBB29" "#FF5E2A" "#D42A1D" "#9B1F17" "#401111"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "Midsommar2"
ari_palette("Midsommar3")
#> [1] "#766FA6" "#8594A9" "#4F686B" "#AD8A2A" "#C1BCB2"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "Midsommar3"
ari_palette("Midsommar4")
#> [1] "#4679A6" "#BFCDD0" "#86816B" "#AA7C6C" "#36312D"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "Midsommar4"
```

### Beau Is Afraid (2023)

``` r
ari_palette("Beau1")
#> [1] "#A5120F" "#F27405" "#D6B575" "#4C7AAD" "#0B0560"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "Beau1"
ari_palette("Beau2")
#> [1] "#BDD3E0" "#324001" "#808C23" "#B8BF7E" "#D92B04"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "Beau2"
ari_palette("Beau3")
#> [1] "#9B2E35" "#387148" "#114C89" "#CAB851" "#8B4928"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "Beau3"
ari_palette("BeauMonster")
#> [1] "#F2EB85" "#625125" "#D9C0BA" "#402A2D" "#0D0D0D"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "BeauMonster"
```

### Eddington (2025)

``` r
ari_palette("Eddington1")
#> [1] "#485249" "#6E705A" "#D3C598" "#D98346" "#D93720"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "Eddington1"
ari_palette("Eddington2")
#> [1] "#779C95" "#3B5355" "#A97162" "#73392C" "#736D68"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "Eddington2"
ari_palette("Eddington3")
#> [1] "#0477BF" "#F20505" "#6A152C" "#137850" "#6F4106"
#> attr(,"class")
#> [1] "palette"
#> attr(,"name")
#> [1] "Eddington3"
```

## Continuous palettes

Any palette can be interpolated to generate as many colors as you need:

``` r
pal <- ari_palette("Hereditary3", 21, type = "continuous")
image(volcano, col = pal)
```

![](figure/volcano-1.png)

``` r
pal <- ari_palette("Midsommar2", 21, type = "continuous")
image(volcano, col = pal)
```

![](figure/volcano2-1.png)

## Palette previews

The `test_palette()` function shows a palette across four chart types —
useful for checking how colors hold up in real use.

``` r
test_palette("Hereditary2")
```

![](figure/test_hereditary2-1.png)

``` r
test_palette("Midsommar1")
```

![](figure/test_midsommar1-1.png)

``` r
test_palette("Eddington1")
```

![](figure/test_eddington1-1.png)
