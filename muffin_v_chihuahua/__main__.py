import os
import click
from streamlit import cli


@click.group()
def main():
    pass


@main.command("muffin-v-chihuahua")
def main_streamlit():
    dirname = os.path.dirname(__file__)
    filename = os.path.join(dirname, 'display_predictions_with_an_embedded_model.py')
    args = []
    cli._main_run(filename, args)


if __name__ == "__main__":
    main()
