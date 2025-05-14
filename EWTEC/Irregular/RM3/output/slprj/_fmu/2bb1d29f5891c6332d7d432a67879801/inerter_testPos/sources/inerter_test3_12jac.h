/* Jacobians */
static const REAL_ATTRIBUTE dummyREAL_ATTRIBUTE = omc_dummyRealAttribute;

#if defined(__cplusplus)
extern "C" {
#endif

/* Jacobian Variables */
#define inerter_test3_INDEX_JAC_H 0
int inerter_test3_functionJacH_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *thisJacobian, ANALYTIC_JACOBIAN *parentJacobian);
int inerter_test3_initialAnalyticJacobianH(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian);


#define inerter_test3_INDEX_JAC_F 1
int inerter_test3_functionJacF_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *thisJacobian, ANALYTIC_JACOBIAN *parentJacobian);
int inerter_test3_initialAnalyticJacobianF(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian);


#define inerter_test3_INDEX_JAC_D 2
int inerter_test3_functionJacD_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *thisJacobian, ANALYTIC_JACOBIAN *parentJacobian);
int inerter_test3_initialAnalyticJacobianD(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian);


#define inerter_test3_INDEX_JAC_C 3
int inerter_test3_functionJacC_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *thisJacobian, ANALYTIC_JACOBIAN *parentJacobian);
int inerter_test3_initialAnalyticJacobianC(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian);


#define inerter_test3_INDEX_JAC_B 4
int inerter_test3_functionJacB_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *thisJacobian, ANALYTIC_JACOBIAN *parentJacobian);
int inerter_test3_initialAnalyticJacobianB(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian);


#define inerter_test3_INDEX_JAC_A 5
int inerter_test3_functionJacA_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *thisJacobian, ANALYTIC_JACOBIAN *parentJacobian);
int inerter_test3_initialAnalyticJacobianA(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian);

#if defined(__cplusplus)
}
#endif

