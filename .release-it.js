"use strict";

const releaseItConfig = {
    verbose: false,
    force: false,
    isDryRun: false,
    git: {
        changelog: 'git log --pretty=format:"* %s (%h)" ${latestTag}...HEAD',
        requireCleanWorkingDir: true,
        addUntrackedFiles: false,
        requireBranch: false,
        requireUpstream: true,
        requireCommits: false,
        commit: true,
        commitMessage: "chore(release): release ${version}",
        commitArgs: "",
        tag: true,
        tagName: "v${version}",
        tagAnnotation: "Release",
        tagArgs: [],
        push: true,
        pushArgs: "--follow-tags",
        pushRepo: "origin",
    },
    // reference: https://github.com/release-it/release-it/blob/master/docs/github-releases.md
    github: {
        release: true,
        releaseName: "v${version}",
        //releaseNotes: null, // Use the default release notes of git.changelog
    },
    npm: {
        publish: false,
    },
    hooks: {
        "before:init": [],
        "after:bump": [],
        "after:git:release": [],
        "after:release": "echo Successfully released ${name} v${version} to ${repo.repository}.",
    },
    plugins: {
        /**
         * Make sure to update the version in version.txt
         * Reference: https://github.com/release-it/bumper
         */
        "@release-it/bumper": {
            /**
             * version.txt has the 'master' version (single source of truth for the current version)
             */
            in: "version.txt",
            /**
             * The updated version number is saved to those files (in addition to package.json)
             */
            out: ["version.txt"],
        },
    },
};

module.exports = releaseItConfig;
