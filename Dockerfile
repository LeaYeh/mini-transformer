# FROM quay.io/jupyter/pytorch-notebook:latest

# USER root

# RUN pip install jupyterhub jupyterhub-dummyauthenticator
# RUN jupyterhub --generate-config

# CMD ["jupyterhub", "--port", "8585", "--ip", "0.0.0.0"]

FROM quay.io/jupyter/pytorch-notebook:latest

USER root

# Install JupyterHub, Dummy Authenticator
RUN pip install jupyterhub jupyterhub-dummyauthenticator
RUN python3 -m ipykernel install --user

# Ensure the directory exists and is writable
RUN chown -R jovyan /home/jovyan
RUN mkdir -p /srv/jupyterhub/
RUN jupyterhub --generate-config -f /srv/jupyterhub/jupyterhub_config.py

# Configure JupyterHub to use Dummy Authenticator
RUN echo "c.JupyterHub.authenticator_class = 'dummyauthenticator.DummyAuthenticator'" >> /srv/jupyterhub/jupyterhub_config.py
RUN echo "c.Authenticator.admin_users = {'admin'}" >> /srv/jupyterhub/jupyterhub_config.py
RUN echo "c.DummyAuthenticator.username = 'jovyan'" >> /srv/jupyterhub/jupyterhub_config.py
RUN echo "c.DummyAuthenticator.password = 'jovyan'" >> /srv/jupyterhub/jupyterhub_config.py

CMD ["jupyterhub", "-f", "/srv/jupyterhub/jupyterhub_config.py", "--port", "8585", "--ip", "0.0.0.0"]

