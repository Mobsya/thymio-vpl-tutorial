                 First Steps in Robotics
                        with the
                    Thymio-II Robot
                        and the
                  Aseba/VPL Environment

                      Moti Ben-Ari
           http://www.weizmann.ac.il/sci-tea/benari/

                Copyright 2013 by Moti Ben-Ari. 

        This work is licensed under the Creative Commons
        Attribution-ShareAlike 3.0 Unported License. To view a copy
        of this license, visit
        http://creativecommons.org/licenses/by-sa/3.0/
        or send a letter to Creative Commons, 444 Castro Street,
        Suite 900, Mountain View, California, 94041, USA.

Aseba is a programming environment for the Thymio-II robot. VPL is a
component of Aseba that enables visual programming by dragging and
dropping colorful blocks. This repository is a tutorial on using the
Thymio-II robot with VPL. For more information on the Thymio-II and
Aseba, see: https://aseba.wikidot.com/.

There are four directories in this repository:

docs:     The text of the tutorial
images:   The images used in the tutorial
programs: The Aseba/VPL programs for the examples in the tutorial
answers:  Answers to the exercises and programs for the answers

This tutorial is written using LaTeX. To compile both the tutorial 
and the answers, under unixes with pdflatex installed, just type:

    make

If you want to build by hand, the files to compile are:

    docs/vpl.tex
    answers/vpl-answers.tex

If you have trouble compiling, or found errors in this document, please
fill an issue at https://github.com/aseba-community/thymio-vpl-tutorial
