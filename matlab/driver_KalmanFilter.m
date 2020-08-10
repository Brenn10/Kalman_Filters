dt = 1/100.0; % rate

A = [1, dt; 
     0, 1]
 
B = [1;
     0]
 
C = [1, 0]

Q = [.01, 0;
      0,.01];
  
R = [.1, 0;
      0,.1];

x_init = [0;
       0]

data = GenerateDataMatricies(x_init,A,B,C,Q,R,dt)
   
P=[1e6,   0;
     0, 1e6]

KF = KalmanFilter()

KF.initialize(x_0,P)

[y_pre, P_pred] = KF.predict(A, B, Q);

[y_upd, P_upd] = KF.update(y_hat, C, R);