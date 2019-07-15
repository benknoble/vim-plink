au BufNewFile,BufRead *.plink setfiletype plink
autocmd BufNewFile,BufRead *
      \ if getline(1) =~? '^#!.*\<plink\(.pm\)\?\>' | setfiletype plink | endif
