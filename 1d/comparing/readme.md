.\run-all-tests.ps1 `
     -ExecutablesRootPath "..\c" `
     -OutputDataDir "..\c\data_analisys" `
     -GlobalSummaryCsv ".\summary_results.csv" `
     -DetailedOutputFileName "mpf_c.csv" `
     -NumberOfRuns 10

.\run-all-tests.ps1 `
     -ExecutablesRootPath "..\haskell\mpf" `
     -OutputDataDir "..\haskell\mpf\data_analisys" `
     -GlobalSummaryCsv ".\summary_results.csv" `
     -DetailedOutputFileName "mpf_hs.csv" `
     -NumberOfRuns 10

.\run-all-tests.ps1 `
     -ExecutablesRootPath "..\python\dist\" `
     -OutputDataDir "..\python\mpf\data_analisys" `
     -GlobalSummaryCsv ".\summary_results.csv" `
     -DetailedOutputFileName "mpf_py.csv" `
     -NumberOfRuns 10