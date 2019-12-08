from setuptools import setup

setup(
    name='password_gen',
    description='A simple password generator',
    url='https://github.com/Celcis/password_gen',
    author='Mehmet Ali Baykara',
    author_email='baykara@uni-bremen.de',
    classifiers=[
        'Programming Language :: Python :: 3.6'
    ],
    install_requires=[
        'random',
        'string'
    ],
    entry_points={
        'console_scripts': [
            'generate = generator.__main__:main'
        ]
    },
    packages=['password_gen'])
