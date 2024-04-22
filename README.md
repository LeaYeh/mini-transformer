# Setup Jupyter Env

Reference tutorial:
> https://medium.com/@FredAsDev/connect-vs-code-jupyter-notebook-to-a-jupyter-container-a63293f29325

1. Build docker container locally

```
./run_dev.sh
```

2. Connect vscode to running Jupyter server
    * Control+Shift+P to open vscode command box.
        * Choose 'Existing JupyterHub Server'
        * dummy account and password: jovyan / jovyan
    * connect with http://127.0.0.1:8585
        * ![jupyter_vscode](./data/doc/img/jupyter_vscode.webp)
    * Select Python Kernel
        * ![jupyter_vscode2](./data/doc/img/jupyter_vscode_2.webp)

3. 🎉Happy coding🎉

