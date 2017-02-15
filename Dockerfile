FROM alpine:3.5

RUN apk add --no-cache bash gawk sed grep bc coreutils curl gcc g++ git coreutils make gfortran R \
                       R-dev libressl-dev curl-dev libxml2-dev ca-certificates &&\
  R -q -e "install.packages('Rcpp', repo='https://cran.rstudio.com')" &&\
  git clone https://github.com/ropensci/git2r.git &&\
  R CMD INSTALL --configure-args="--with-libssl-include=/usr/lib/" git2r &&\
  R -q -e "install.packages(c('devtools'), repo='https://cran.rstudio.com/')" &&\
  rm -rf git2r /tmp/*

RUN apk add --no-cache gsl gsl-dev

RUN echo "options(repos=structure(c(CRAN=\"https://cran.rstudio.com\")))" > ~/.Rprofile
ADD dependencies.R dependencies.R
RUN Rscript dependencies.R
