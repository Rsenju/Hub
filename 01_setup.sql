-- =====================================================
-- DEUTSCH HUB — 01_setup.sql
-- Extensões e configurações iniciais.
-- Execute este arquivo PRIMEIRO, antes dos demais.
-- =====================================================


-- ── Extensões ─────────────────────────────────────
-- gen_random_uuid() vem do pgcrypto (já ativo no Supabase por padrão).
-- A linha abaixo garante que esteja disponível em projetos novos.
CREATE EXTENSION IF NOT EXISTS pgcrypto;


-- ── Função para atualizar updated_at automaticamente ──
-- Reutilizada por todas as tabelas que têm a coluna updated_at.
CREATE OR REPLACE FUNCTION public.set_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;
