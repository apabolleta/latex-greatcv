% **********************************************************************************
% Great CV LaTeX document class
%
% Author:   Asier Pabolleta Martorell <apabolleta@gmail.com>
% License:  See LICENSE
% **********************************************************************************


% ==================================================================================
%
%   IDENTIFICATION
%
% ==================================================================================

% LaTeX2e version required
\NeedsTeXFormat{LaTeX2e}

% Document class identification
\ProvidesClass{greatcv}[2021/08/16 Great CV LaTeX document class]

% ==================================================================================
%
%   PRELIMINARY DECLARATIONS
%
% ==================================================================================

% ----------------------------------------------------------------------------------
%   PACKAGE REQUIREMENTS
% ----------------------------------------------------------------------------------

\RequirePackage{moresize}                    % Extend font sizes
\RequirePackage{graphicx}                    % Manage graphics
\RequirePackage{xcolor}                      % Manage colors
\RequirePackage{fontawesome}                 % Font Awesome icons
\RequirePackage{calc}                        % Extend length calculations
\RequirePackage{tikz}                        % Create graphics
\RequirePackage{array}                       % Extend array and tabular environments
\RequirePackage[absolute, overlay]{textpos}  % Text box positioning
\RequirePackage{background}                  % Custom background
\RequirePackage{ragged2e}                    % Text alignment
\RequirePackage{framed}                      % Extend environments

% ----------------------------------------------------------------------------------
%   CV DEFINITIONS
% ----------------------------------------------------------------------------------

% Name
\newcommand{\cvname}[1]{\renewcommand{\@cvname}{#1}}
\newcommand{\@cvname}{Profile Name}
% Short description
\newcommand{\cvdescription}[1]{\renewcommand{\@cvdescription}{#1}}
\newcommand{\@cvdescription}{Short Description}
% Birthday
\newcommand{\cvbirthday}[1]{\renewcommand{\@cvbirthday}{#1}}
\newcommand{\@cvbirthday}{}
% Address
\newcommand{\cvaddress}[1]{\renewcommand{\@cvaddress}{#1}}
\newcommand{\@cvaddress}{}
% Phone number
\newcommand{\cvphone}[1]{\renewcommand{\@cvphone}{#1}}
\newcommand{\@cvphone}{}
% Email address
\newcommand{\cvemail}[1]{\renewcommand{\@cvemail}{#1}}
\newcommand{\@cvemail}{}
% Profile picture
\newcommand{\cvpicture}[1]{\renewcommand{\@cvpicture}{#1}}
\newcommand{\@cvpicture}{}

% LinkedIn profile
\newcommand{\cvlinkedin}[1]{\renewcommand{\@cvlinkedin}{#1}}
\newcommand{\@cvlinkedin}{}
% GitHub account
\newcommand{\cvgithub}[1]{\renewcommand{\@cvgithub}{#1}}
\newcommand{\@cvgithub}{}
% GitLab account
\newcommand{\cvgitlab}[1]{\renewcommand{\@cvgitlab}{#1}}
\newcommand{\@cvgitlab}{}

% Sidebar width percentage
\newcommand{\cvsidebarwidthpercentage}[1]{\renewcommand{\@cvsidebarwidthpercentage}{#1}}
\newcommand{\@cvsidebarwidthpercentage}{0.3}

% Empty string definition
\newcommand{\@cvempty}{}

% ----------------------------------------------------------------------------------
%   COLOR DEFINITIONS
% ----------------------------------------------------------------------------------

\definecolor{cvmainsectiontitlecolor}{HTML}{122e4d}          % Main section title color
\definecolor{cvmainsectionrulecolor}{HTML}{d5d5d5}           % Main section rule color
\definecolor{cvsidebarbackgroundcolor}{HTML}{3b6088}         % Sidebar background color
\definecolor{cvsidebarsectiontitlecolor}{HTML}{ffffff}       % Sidebar section title color
\definecolor{cvsidebarsectionbackgroundcolor}{HTML}{122e4d}  % Sidebar section background color
\definecolor{cvsidebartextcolor}{HTML}{ffffff}               % Sidebar text color
\definecolor{cvsidebariconcolor}{HTML}{0a1b2e}               % Sidebar icon color
\definecolor{cvbulletcolor}{HTML}{0a1b2e}                    % Bullet color
\definecolor{cvcheckiconcolor}{HTML}{42b020}                 % Check icon color

% ----------------------------------------------------------------------------------
%   LENGTH DEFINITIONS
% ----------------------------------------------------------------------------------

% Page margin
\newlength\cvmargin
\setlength\cvmargin{1cm}

% Main section title top margin
\newlength\cvmainsectiontitletopmargin
\setlength\cvmainsectiontitletopmargin{5pt}
% Main section title bottom margin
\newlength\cvmainsectiontitlebottommargin
\setlength\cvmainsectiontitlebottommargin{5pt}
% Main section title left margin
\newlength\cvmainsectiontitleleftmargin
\setlength\cvmainsectiontitleleftmargin{0pt}
% Main section title indent
\newlength\cvmainsectiontitleindent
\setlength\cvmainsectiontitleindent{5pt}
% Main section title padding
\newlength\cvmainsectiontitlepadding
\setlength\cvmainsectiontitlepadding{4pt}
% Main section rule thickness
\newlength\cvmainsectionrulethickness
\setlength\cvmainsectionrulethickness{2pt}

% Sidebar section title top margin
\newlength\cvsidebarsectiontitletopmargin
\setlength\cvsidebarsectiontitletopmargin{0pt}
% Sidebar section title bottom margin
\newlength\cvsidebarsectiontitlebottommargin
\setlength\cvsidebarsectiontitlebottommargin{0pt}
% Sidebar section title left margin
\newlength\cvsidebarsectiontitleleftmargin
\setlength\cvsidebarsectiontitleleftmargin{0pt}
% Sidebar section title padding
\newlength\cvsidebarsectiontitlepadding
\setlength\cvsidebarsectiontitlepadding{-5pt}
% Sidebar section rule thickness
\newlength\cvsidebarsectionrulethickness
\setlength\cvsidebarsectionrulethickness{0.5pt}

% ----------------------------------------------------------------------------------
%   ICONS
% ----------------------------------------------------------------------------------

\newcommand{\cvcheckicon}{{\color{cvcheckiconcolor}\faCheckCircle}}  % Check icon
\newcommand{\cvfilledicon}{{\color{cvbulletcolor}\faCircle}}         % Filled bullet icon
\newcommand{\cvemptyicon}{{\color{cvbulletcolor!30}\faCircle}}       % Empty bullet icon

% ----------------------------------------------------------------------------------
%   CV COMMANDS
% ----------------------------------------------------------------------------------

% Checks if attribute is empty and executes corresponding code
%   param 1: empty definition, default: \empty
%   param 2: attribute to check
%   param 3: code to execute if empty
%   param 4: code to execute if not empty
\newcommand{\cv@ifempty}[4][\@cvempty]{
\if#2#1
    #3
\else
    #4
\fi
}

% Makes CV profile
\newcommand{\cvmakeprofile}{
\cv@ifempty{\@cvpicture}
    {}
    {\includegraphics[width=\linewidth]{\@cvpicture}\bigskip\newline}
    
\begin{minipage}{0.95\linewidth}
    {\HUGE\bfseries\@cvname}\medskip
    
    {\Large\@cvdescription}\bigskip
    
    {
    \Huge
    \cv@ifempty{\@cvlinkedin}
        {}
        {\href{\@cvlinkedin}{\color{cvsidebariconcolor}\faLinkedinSquare}}%
    \cv@ifempty{\@cvgithub}
        {}
        {\href{\@cvgithub}{\color{cvsidebariconcolor}\faGithub}}%
    \cv@ifempty{\@cvgitlab}
        {}
        {\href{\@cvgitlab}{\color{cvsidebariconcolor}\faGitlab}}%
    }
\end{minipage}\par\smallskip

{\color{cvsidebarsectionbackgroundcolor}\rule{\textwidth}{\cvsidebarsectionrulethickness}}\bigskip

\cv@ifempty{\@cvbirthday}
        {}
        {\cvinfo[\faCalendar]{Fecha de nacimiento}{\@cvbirthday}}
\cv@ifempty{\@cvaddress}
        {}
        {\cvinfo[\faMapMarker]{Dirección}{\@cvaddress}}
\cv@ifempty{\@cvphone}
        {}
        {\cvinfo[\faPhone]{Número de teléfono}{\href{tel:\@cvphone}{\@cvphone}}}
\cv@ifempty{\@cvemail}
        {}
        {\cvinfo[\faEnvelope]{Correo electrónico}{\href{mailto:\@cvemail}{\@cvemail}}}
}

% Creates CV item
%   param 1: content
\newcommand{\cvitem}[1]{
\parbox{0.8\linewidth}{#1}
{\color{cvsidebarsectionbackgroundcolor}\rule{0.9\linewidth}{\cvsidebarsectionrulethickness}}\par\medskip
}

% Creates CV date item
%   param 1: date
%   param 2: content
\newcommand{\cvdateitem}[2]{
\begin{tabular}{>{\centering}m{0.15\linewidth} | p{0.8\linewidth}}
    #1 & 
    \begin{minipage}{\linewidth}
        #2
    \end{minipage}
\end{tabular}\par\medskip
}

% Creates CV timeline item
%   param 1: begin date
%   param 2: end date
%   param 3: content
\newcommand{\cvtimelineitem}[3]{
\begin{tikzpicture}[
    every node/.style = {node distance=0pt},
    timelinedate/.style = {text width=0.15\linewidth, align=center},
    timelinecontent/.style = {text width=0.8\linewidth}
    ]
    \node[timelinecontent] (content) {
        \begin{minipage}{\linewidth}
            #3
        \end{minipage}
    };
    \node[timelinedate] (enddate) [above left = of content, anchor=north east] {\footnotesize #2};
    \node[timelinedate] (begindate) [below left = of content, anchor=south east] {\footnotesize #1};
    \draw[Turned Square-Turned Square] (begindate) -- (enddate);
\end{tikzpicture}\par\medskip
}

% Creates CV skill
%   param 1: total, default: 10
%   param 2: label
%   param 3: level out of total
\newcommand{\cvskill}[3][10]{
\makebox[0.3\linewidth][l]{#2}
\makebox{
    \foreach \i in {1, ..., #1}{
        \ifnum \i > #3
            \cvemptyicon
        \else
            \cvfilledicon
        \fi
    }
}\par\smallskip
}

% Creates CV info item
%   param 1: icon/label, default: \faInfoCircle
%   param 2: heading
%   param 3: content
\newcommand{\cvinfo}[3][\faInfoCircle]{
\begin{tikzpicture}[
    every node/.style = {node distance=0pt},
    icon/.style = {text width=0.1\linewidth, align=center},
    textitem/.style = {}
    ]
    \node[icon] (icon) {\huge\color{cvsidebariconcolor} #1};
    \node[textitem] (heading) [right = of icon] {\large\bfseries #2};
    \node[textitem] (content) [right = of icon.south east, anchor=north west] {
        \begin{minipage}{0.8\linewidth}
            #3
        \end{minipage}
    };
\end{tikzpicture}\par\smallskip
}

% Creates CV language item
%   param 1: language
%   param 2: level
\newcommand{\cvlanguage}[2]{
\makebox[0.3\linewidth][l]{#1}
\makebox{#2}\par\smallskip
}

% ==================================================================================
%
%   OPTIONS
%
% ==================================================================================

% ----------------------------------------------------------------------------------
%   DECLARE OPTIONS
% ----------------------------------------------------------------------------------

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}  % Pass options to article
\ProcessOptions\relax

% ----------------------------------------------------------------------------------
%   BASE DOCUMENT CLASS
% ----------------------------------------------------------------------------------

\LoadClass[a4paper]{article}

% ==================================================================================
%
%   MORE DECLARATIONS
%
% ==================================================================================

% ----------------------------------------------------------------------------------
%   ENCODING AND LANGUAGE SETTINGS
% ----------------------------------------------------------------------------------

% UTF-8 as default input encoding (charset)
\RequirePackage[utf8]{inputenc}

% T1 as font encoding
\RequirePackage[T1]{fontenc}

% Extend document capabilities for specific languages
\RequirePackage[spanish]{babel}

% ----------------------------------------------------------------------------------
%   FONT BASICS
% ----------------------------------------------------------------------------------

\RequirePackage[default]{raleway}          % Set raleway font to default

\renewcommand{\familydefault}{\sfdefault}  % Set Sans Serif as default font family

% ----------------------------------------------------------------------------------
%   LAYOUT
% ----------------------------------------------------------------------------------

% Disable default indent
\setlength\parindent{0pt}

% Disable hyphenation
\RequirePackage[none]{hyphenat}

% Increase tolerance
\sloppy

% Disable page numbering
\pagenumbering{gobble}

% Sidebar width
\newlength\cvsidebarwidth
\setlength\cvsidebarwidth{\@cvsidebarwidthpercentage\paperwidth}

% Main section width
\newlength\cvmainwidth
\setlength\cvmainwidth{\paperwidth - \cvsidebarwidth - 1.5\cvmargin}

% Set page size and margins
\RequirePackage[a4paper, noheadfoot, nomarginpar, textwidth=\cvmainwidth, top=\cvmargin, left=\cvmargin, bottom=\cvmargin]{geometry}

% ----------------------------------------------------------------------------------
%   BACKGROUND
% ----------------------------------------------------------------------------------

% CV background image
\newcommand{\cvbackground}{
\begin{tikzpicture}
    \fill[cvsidebarbackgroundcolor] (0, 0) rectangle (\cvsidebarwidth, \paperheight);
\end{tikzpicture}
}

% Set background
\backgroundsetup{
scale=1,
angle=0,
position=current page.north east,
nodeanchor=north east,
opacity=1,
contents={\cvbackground}
}

% ----------------------------------------------------------------------------------
%   LINKS AND REFERENCES
% ----------------------------------------------------------------------------------

% Manage links and references
\RequirePackage{hyperref}

% Set links formatting
\hypersetup{
    colorlinks=true,
    urlcolor=blue,
    pdftitle={Great CV},
    pdfauthor={Asier Pabolleta Martorell <asier.pabolleta@gmail.com>},
}

% ----------------------------------------------------------------------------------
%   GRAPHICS
% ----------------------------------------------------------------------------------

\usetikzlibrary{babel, arrows.meta, positioning, calc}

% ----------------------------------------------------------------------------------
%   MAIN CV SECTION
% ----------------------------------------------------------------------------------

% Custom section titles
\RequirePackage{titlesec}

% Set section title spacing
\titlespacing*{\section}
    {\cvmainsectiontitleleftmargin}
    {\cvmainsectiontitletopmargin}
    {\cvmainsectiontitlebottommargin}

% Section rule
\newcommand{\cvmainsectionrule}{
\vspace{\cvmainsectiontitlepadding}
{\color{cvmainsectionrulecolor}\titlerule[\cvmainsectionrulethickness]}
\vspace{\cvmainsectiontitlepadding}
}

% Section title format
\newcommand{\cvmainsectiontitle}{
\Large\bfseries\color{cvmainsectiontitlecolor}
}

% Customize section heading
\titleformat{\section}
    {\cvmainsectionrule\cvmainsectiontitle}                  % Before section number
    {\hspace{\cvmainsectiontitleindent}\thesection.}         % Section title prefix
    {1em}                                                    % Section prefix-to-title spacing
    {\hspace{\cvmainsectiontitleindent}\cvmainsectiontitle}  % Before section title
    [\cvmainsectionrule]                                     % After section title

% ----------------------------------------------------------------------------------
%   SIDEBAR CV SECTION
% ----------------------------------------------------------------------------------

\newenvironment{cvsidebar}
{

% Set section title spacing
\titlespacing*{\section}
    {\cvsidebarsectiontitleleftmargin}
    {\cvsidebarsectiontitletopmargin}
    {\cvsidebarsectiontitlebottommargin}

% Sidebar section title format
\newcommand{\cvsidebarsectiontitle}{
\Large\bfseries\raggedright\vspace{\cvsidebarsectiontitlepadding}\color{cvsidebarsectiontitlecolor}
}

% Set shadecolor to shaded environment
\colorlet{shadecolor}{cvsidebarsectionbackgroundcolor}

% Customize section heading
\titleformat{\section}
    [block]
    {\begin{shaded*}\cvsidebarsectiontitle}  % Before section number
    {\thesection.}                           % Section title prefix
    {1em}                                    % Section prefix-to-title spacing
    {\cvsidebarsectiontitle}                 % Before section title
    [\end{shaded*}]                          % After section title

\begin{textblock*}{\cvsidebarwidth}(\paperwidth - \cvsidebarwidth, \cvmargin)
\color{cvsidebartextcolor}
\centering
}
{
\normalcolor
\end{textblock*}
}