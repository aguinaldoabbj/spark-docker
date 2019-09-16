FROM jupyter/base-notebook

USER root

#gcc is a dependency of sparkmagic
RUN apt update && apt install -y \
    gcc
    
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
  
COPY prepare.sh /prepare.sh
RUN chmod +x /prepare.sh

ENTRYPOINT ["tini", "--", "/prepare.sh"]
CMD ["start-notebook.sh"]

#USER $NB_UID
  
