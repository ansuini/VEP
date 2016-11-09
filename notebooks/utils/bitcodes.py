import numpy as np

def get_static_gratings():
    
    ''' 
    return organized bitcodes of static gratings
    '''    
    g = np.array([7, 19, 15, 11])
    BCS = g
    BCS = np.vstack((BCS, g + 1))
    BCS = np.vstack((BCS, g + 2))
    BCS = np.vstack((BCS, g + 3))       
    return BCS

def get_moving_gratings():
    
    ''' 
    return organized bitcodes of moving gratings
    '''    
    n = 8;
    ndirs = 8;
    g = np.array([175, 177, 179, 181]);
    g = np.hstack((g, g+1))
    BCS = g
    BCS = np.vstack((BCS, g + 6*n))
    BCS = np.vstack((BCS, g + n))
    BCS = np.vstack((BCS, g + 4*n))
    BCS = np.vstack((BCS, g - n))
    BCS = np.vstack((BCS, g + 5*n))
    BCS = np.vstack((BCS, g + 2*n))
    BCS = np.vstack((BCS, g + 3*n))         
    return BCS.T

def get_moving_dots():

    ''' 
    return organized bitcodes of moving dots
    '''
    n = 4;
    ndirs = 8;
    g = np.array([315, 317]);
    g = np.hstack((g, g+1))
    BCS = g
    BCS = np.vstack((BCS, g + 6*n))
    BCS = np.vstack((BCS, g + n))
    BCS = np.vstack((BCS, g + 4*n))
    BCS = np.vstack((BCS, g - n))
    BCS = np.vstack((BCS, g + 5*n))
    BCS = np.vstack((BCS, g + 2*n))
    BCS = np.vstack((BCS, g + 3*n))         
    return BCS.T