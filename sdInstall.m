function sdInstall

    % --- Moving the main script to the user path ---
    ROOT_FOLDER = pwd;
    copyfile(fullfile(ROOT_FOLDER, "sd.m"), userpath)

    % --- Create the initial function signatures with the bult-in functions ---
    updateFunctionSignatures()
    if ~exist(fullfile(userpath, "resources"), "dir")
        mkdir(fullfile(userpath, "resources"))
    end
    copyfile(fullfile(ROOT_FOLDER, "resources", "functionSignatures.json"), fullfile(userpath, "resources"))

    % Load files if files.mat exists
    if exist("files.mat","file") == 2
        sd files load
    end

    % Load bookmarks if bookmarks.mat exists
    if exist("bookmarks.mat","file") == 2
        sd book load
    end
end
