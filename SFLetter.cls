%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Stephen Fendyke
%   February 2010
%
%   Custom Letter Class
%
%   Fields:
%           \name          : Name of the sender
%           \date          : In any format you like
%           \address       : Address of the sender (appears in top right). Lines
%                          : of address separated by '\\'. No '\\' after last line.
%           \email         : Email of the sender (below address)
%           \greeting      : The greeting you would like (e.g. Dear Sir,)
%           \subject       : Subject of the letter
%           \signoff       : Signoff with space left for a signature (e.g. Regards,)
%           \signaturefile : PNG file containing your signature. If not, a space will be left.
%           
%           If any of these are not provided, the class will use
%           a default without crashing.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Sample file
% -----------
%
%  \documentclass{SFLetter}
%
%  \name{John Smith}
%  \date{16th February 2010}
%  \subject{Re: This is of the utmost importance}
%  \greeting{Dear Sir/Madam,}
%  \signoff{Yours faithfully,}
%  \address{John Smith\\Room JS110\\Institute of Science\\Smithton\\SM1 THJ}
%  \email{smithj@science.co.uk}
%
%  \begin{document}
%
%  \maketitle
%
%  Blah blah blah blah.
%
%  \makeclosing
%
%  \end{document}
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Basic setup. We require a recent version of LaTeX, we are providing a
% class called "SFLetter" and we poach the setup for an 11pt, a4 article.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{SFLetter}[2010/02/16 S. Fendyke Custom letter class]
\LoadClass[11pt,a4paper,oneside]{article}

\RequirePackage{graphicx}
% There are no other required packages. If there were, they should be added here.
% e.g.
%\RequirePackage{url}

% Set the margins to a reasonable size - this is much smaller than the 
% LaTeX default.
\addtolength{\oddsidemargin}{-0.875in}
\addtolength{\evensidemargin}{-0.875in}
\addtolength{\textwidth}{1.5in}
\addtolength{\topmargin}{-0.875in}
\addtolength{\textheight}{1.5in}

% Turn off paragraph indenting, and add empty vertical space between them
% instead. This gives the text a "block" layout.
\setlength{\parindent}{0.0in} % stop indenting
\setlength{\parskip}{0.2in}

% Turn off page numbering
\pagestyle{empty}

% Define the commands that the user will need in order to tell LaTeX the
% specifics about the letter: e.g. date, etc.
\renewcommand{\date}[1]{%                           
  \newcommand{\SFdate}{#1} 
}

\newcommand{\email}[1]{%                           
  \newcommand{\SFemail}{#1\\} 
}

\newcommand{\name}[1]{%                           
  \newcommand{\SFname}{#1} 
}

\newcommand{\subject}[1]{%                           
  \newcommand{\SFsubject}{\textbf{#1}} 
}

\newcommand{\greeting}[1]{%                           
  \newcommand{\SFgreeting}{#1\par} 
}

\newcommand{\signoff}[1]{%                           
  \newcommand{\SFsignoff}{#1} 
}

\newcommand{\address}[1]{%                           
  \newcommand{\SFaddress}{#1\\} 
}

\newcommand{\signaturefile}[1]{%
  \newcommand{\SFsignaturefile}{#1}
}

\newcommand{\makeclosing}{%

\ifx\SFsignoff\undefined
\newcommand{\SFsignoff}{Regards,}
\else
\relax
\fi

\SFsignoff\par
\ifx\SFname\undefined
\relax
\else

\ifx\SFsignaturefile\undefined
\vspace{1cm}
\else
\includegraphics[height=2cm]{\SFsignaturefile}\\
\fi
\SFname
\fi
}

\renewcommand{\maketitle}{%

\ifx\SFdate\undefined
\newcommand{\SFdate}{\today} 
\else
\relax
\fi

\ifx\SFgreeting\undefined
\newcommand{\SFgreeting}{Dear Sir/Madam,} 
\else
\relax
\fi

\begin{minipage}{\textwidth}         
\begin{flushright}
\ifx\SFaddress\undefined     % If address is given, then display it
\relax
\else
\SFaddress
\fi
\ifx\SFemail\undefined       %If email is defined then display it
\relax
\else
\vspace{0.5cm}
\textit{\SFemail}
\fi
\vspace{0.5cm}
\SFdate
\vspace{2cm}
\end{flushright}
\end{minipage}
\SFgreeting
\ifx\SFsubject\undefined
\relax
\else
\SFsubject
\fi
}

