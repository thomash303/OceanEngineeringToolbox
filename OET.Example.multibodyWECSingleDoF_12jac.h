/* Jacobians */
static const REAL_ATTRIBUTE dummyREAL_ATTRIBUTE = omc_dummyRealAttribute;

#if defined(__cplusplus)
extern "C" {
#endif

/* Jacobian Variables */
#define OET_Example_multibodyWECSingleDoF_INDEX_JAC_LSJac1 0
int OET_Example_multibodyWECSingleDoF_functionJacLSJac1_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *thisJacobian, ANALYTIC_JACOBIAN *parentJacobian);
int OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianLSJac1(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian);


#define OET_Example_multibodyWECSingleDoF_INDEX_JAC_NLSJac2 1
int OET_Example_multibodyWECSingleDoF_functionJacNLSJac2_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *thisJacobian, ANALYTIC_JACOBIAN *parentJacobian);
int OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianNLSJac2(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian);


#define OET_Example_multibodyWECSingleDoF_INDEX_JAC_LSJac3 2
int OET_Example_multibodyWECSingleDoF_functionJacLSJac3_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *thisJacobian, ANALYTIC_JACOBIAN *parentJacobian);
int OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianLSJac3(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian);


#define OET_Example_multibodyWECSingleDoF_INDEX_JAC_NLSJac4 3
int OET_Example_multibodyWECSingleDoF_functionJacNLSJac4_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *thisJacobian, ANALYTIC_JACOBIAN *parentJacobian);
int OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianNLSJac4(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian);


#define OET_Example_multibodyWECSingleDoF_INDEX_JAC_H 5
int OET_Example_multibodyWECSingleDoF_functionJacH_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *thisJacobian, ANALYTIC_JACOBIAN *parentJacobian);
int OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianH(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian);


#define OET_Example_multibodyWECSingleDoF_INDEX_JAC_F 6
int OET_Example_multibodyWECSingleDoF_functionJacF_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *thisJacobian, ANALYTIC_JACOBIAN *parentJacobian);
int OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianF(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian);


#define OET_Example_multibodyWECSingleDoF_INDEX_JAC_D 7
int OET_Example_multibodyWECSingleDoF_functionJacD_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *thisJacobian, ANALYTIC_JACOBIAN *parentJacobian);
int OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianD(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian);


#define OET_Example_multibodyWECSingleDoF_INDEX_JAC_C 8
int OET_Example_multibodyWECSingleDoF_functionJacC_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *thisJacobian, ANALYTIC_JACOBIAN *parentJacobian);
int OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianC(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian);


#define OET_Example_multibodyWECSingleDoF_INDEX_JAC_B 9
int OET_Example_multibodyWECSingleDoF_functionJacB_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *thisJacobian, ANALYTIC_JACOBIAN *parentJacobian);
int OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianB(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian);


#define OET_Example_multibodyWECSingleDoF_INDEX_JAC_A 10
int OET_Example_multibodyWECSingleDoF_functionJacA_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *thisJacobian, ANALYTIC_JACOBIAN *parentJacobian);
int OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianA(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian);


#define OET_Example_multibodyWECSingleDoF_INDEX_JAC_StateSetJac5 4
int OET_Example_multibodyWECSingleDoF_functionJacStateSetJac5_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *thisJacobian, ANALYTIC_JACOBIAN *parentJacobian);
int OET_Example_multibodyWECSingleDoF_initialAnalyticJacobianStateSetJac5(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian);

#if defined(__cplusplus)
}
#endif

