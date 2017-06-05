<?php

namespace Boris;

/**
 * Config handles loading configuration files for boris
 */
class Config
{
    private $_searchPaths;
    private $_cascade = false;
    private $_files = array();

    /**
     * Create a new Config instance, optionally with an array
     * of paths to search for configuration files.
     *
     * Additionally, if the second, optional boolean argument is
     * true, all existing configuration files will be loaded, and
     * effectively merged.
     *
     * @param array $searchPaths
     * @param bool  $cascade
     */
    public function __construct($searchPaths = null, $cascade = false)
    {
        $this->_cascade     = (bool) $cascade;
        $this->_searchPaths = is_array($searchPaths) ? $searchPaths : null;

        if (is_null($this->_searchPaths)) {
            $this->_searchPaths = array();

            if ($userHome = getenv('HOME')) {
                $this->_searchPaths[] = "{$userHome}/.borisrc";
            }

            $this->_searchPaths[] = getcwd() . '/.borisrc';
        }
    }

    /**
     * Searches for configuration files in the available
     * search paths, and applies them.
     *
     * Returns true if any configuration files were found.
     *
     * @param  Boris\Boris $boris
     * @return bool
     */
    public function apply(Boris $boris)
    {
        $applied = false;

        foreach ($this->_searchPaths as $path) {
            if (is_readable($path)) {
                $this->_loadInIsolation($path, $boris);

                $applied        = true;
                $this->_files[] = $path;

                if (!$this->_cascade) {
                    break;
                }
            }
        }

        return $applied;
    }

    /**
     * Returns an array of files that were loaded
     * for this Config
     *
     * @return array
     */
    public function loadedFiles()
    {
        return $this->_files;
    }

    // -- Private Methods

    private function _loadInIsolation($path, $boris)
    {
        require $path;
    }
}
