;;; Compiled snippets and support files for `cperl-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'cperl-mode
                     '(("Yt" "use Circonus::Log;\nuse Data::Dumper;\nsub trace { cerror(Dumper(@_),\"trace\"); }\n" "perl-trace" nil nil nil "/Users/hartmann/.emacs.d/snippets/cperl-mode/perl-trace" nil nil)
                       ("Ys" "use Carp;\nsub stack { cerror(Carp::longmess(), \"trace\"); }\n" "perl-stacktrace" nil nil nil "/Users/hartmann/.emacs.d/snippets/cperl-mode/perl-stacktrace" nil nil)
                       ("Yd" "use Circonus::Log;\nuse Data::Dumper;\nuse Carp;\nsub trace { cerror(Dumper(@_),\"trace\"); }\nsub stack { cerror(Carp::longmess(), \"trace\"); }\n" "debug" nil nil nil "/Users/hartmann/.emacs.d/snippets/cperl-mode/perl-debug" nil nil)
                       ("Yp" "use Data::Dumper;\nsub trace { print(Dumper(@_)); }\n" "debug print" nil nil nil "/Users/hartmann/.emacs.d/snippets/cperl-mode/debug_print" nil nil)))


;;; Do not edit! File generated at Mon Jan  6 15:08:17 2020
