
# coding: utf-8

# In[1]:


#get_ipython().run_line_magic('matplotlib', 'inline')
from pygem import RBFParameters, RBF, StlHandler, VtkHandler
import numpy as np
import matplotlib.pyplot as plt


# In[2]:


params = RBFParameters()
params.read_parameters(filename='../tests/test_datasets/parameters_rbf_custom.prm')


# In[2]:


vtk_handler = VtkHandler()
mesh = vtk_handler.parse('../tests/test_datasets/Merged.vtk')


# In[4]:


rbf = RBF(params, mesh)
rbf.perform()
new_mesh_points = rbf.modified_mesh_points
vtk_handler.write(new_mesh_points, "morphed_mesh.vtk")
