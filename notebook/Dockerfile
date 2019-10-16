FROM jupyter/base-notebook

USER root

#gcc is a dependency of sparkmagic
RUN apt update && apt install -y \
    gcc \
    git
        
RUN pip install \
    pykube-ng \
    sparkmagic

#setup sparkmagic
RUN /opt/conda/bin/jupyter labextension install @jupyter-widgets/jupyterlab-manager \
    && cd /opt/conda/lib/python3.*/site-packages/sparkmagic/ \
    && /opt/conda/bin/jupyter-kernelspec install kernels/sparkkernel \
    && /opt/conda/bin/jupyter-kernelspec install kernels/pysparkkernel \
    && /opt/conda/bin/jupyter-kernelspec install kernels/sparkrkernel \
    && /opt/conda/bin/jupyter serverextension enable --py sparkmagic
  
#fixing permissions
RUN chown -R $NB_USER /usr/local/share/jupyter
RUN chown -R $NB_USER /home/${NB_USER}
#RUN chown -R $NB_USER /home/${NB_USER}/.local/share/jupyter/

COPY prepare.sh /prepare.sh
RUN chmod +x /prepare.sh

USER $NB_USER

ENTRYPOINT ["tini", "--", "/prepare.sh"]

CMD ["start-notebook.sh"]


  
