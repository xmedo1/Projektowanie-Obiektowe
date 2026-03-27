<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Attribute\Route;
use App\Entity\User;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;

#[Route('/api/users')]
class UserController extends AbstractController
{
    #[Route('', methods: ['POST'])]
    public function create(Request $request, EntityManagerInterface $em): JsonResponse
    {
        $data = json_decode($request->getContent(), true);
        $user = new User();
        $user->setEmail($data['email'] ?? 'user@user.com');
        $user->setUsername($data['username'] ?? 'user123');
        $em->persist($user);
        $em->flush();
        return $this->json($user, 201);
    }

    #[Route('', methods: ['GET'])]
    public function index(UserRepository $repository): JsonResponse
    {
        return $this->json($repository->findAll());
    }

    #[Route('/{id}', methods: ['GET'])]
    public function show(User $user): JsonResponse
    {
        return $this->json($user);
    }
    
    #[Route('/{id}', methods: ['PUT'])]
    public function update(Request $request, User $user, EntityManagerInterface $em): JsonResponse
    {
        $data = json_decode($request->getContent(), true);
        $user->setEmail($data['email'] ?? $user->getEmail());
        $user->setUsername($data['username'] ?? $user->getUsername());
        $em->flush();
        return $this->json($user);
    }

    #[Route('/{id}', methods: ['DELETE'])]
    public function delete(User $user, EntityManagerInterface $em): JsonResponse
    {
        $em->remove($user);
        $em->flush();
        return $this->json(null, 204);
    }
}