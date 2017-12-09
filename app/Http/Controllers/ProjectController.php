<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\Contracts\ProjectRepositoryInterface;


class ProjectController extends Controller
{
  public $projectRepository;
  public function __construct(ProjectRepositoryInterface $projectRepository)
  {
  	$this->projectRepository = $projectRepository;
  }
  public function listProjects()
  {
  	return $this->projectRepository->getAll();
  }
}
