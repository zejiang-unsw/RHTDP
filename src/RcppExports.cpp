// This file was generated by Rcpp::compileAttributes
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// htdpinit
void htdpinit();
RcppExport SEXP htdp_htdpinit() {
BEGIN_RCPP
    Rcpp::RNGScope __rngScope;
    htdpinit();
    return R_NilValue;
END_RCPP
}
// displacement
DataFrame displacement(NumericMatrix xy, Date start, Date end, int iopt);
RcppExport SEXP htdp_displacement(SEXP xySEXP, SEXP startSEXP, SEXP endSEXP, SEXP ioptSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< NumericMatrix >::type xy(xySEXP);
    Rcpp::traits::input_parameter< Date >::type start(startSEXP);
    Rcpp::traits::input_parameter< Date >::type end(endSEXP);
    Rcpp::traits::input_parameter< int >::type iopt(ioptSEXP);
    __result = Rcpp::wrap(displacement(xy, start, end, iopt));
    return __result;
END_RCPP
}
