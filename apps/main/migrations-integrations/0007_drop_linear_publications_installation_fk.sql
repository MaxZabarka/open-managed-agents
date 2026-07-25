PRAGMA foreign_keys=OFF;--> statement-breakpoint
CREATE TABLE `__new_linear_publications` (
	`id` text PRIMARY KEY NOT NULL,
	`tenant_id` text NOT NULL,
	`user_id` text NOT NULL,
	`agent_id` text NOT NULL,
	`installation_id` text NOT NULL,
	`mode` text NOT NULL,
	`status` text NOT NULL,
	`persona_name` text NOT NULL,
	`persona_avatar_url` text,
	`capabilities` text NOT NULL,
	`session_granularity` text NOT NULL,
	`created_at` integer NOT NULL,
	`unpublished_at` integer,
	`environment_id` text,
	`client_id` text,
	`client_secret_cipher` text,
	`webhook_secret_cipher` text,
	`signing_secret_cipher` text,
	`vault_id` text
);
--> statement-breakpoint
INSERT INTO `__new_linear_publications`("id", "tenant_id", "user_id", "agent_id", "installation_id", "mode", "status", "persona_name", "persona_avatar_url", "capabilities", "session_granularity", "created_at", "unpublished_at", "environment_id", "client_id", "client_secret_cipher", "webhook_secret_cipher", "signing_secret_cipher", "vault_id") SELECT "id", "tenant_id", "user_id", "agent_id", "installation_id", "mode", "status", "persona_name", "persona_avatar_url", "capabilities", "session_granularity", "created_at", "unpublished_at", "environment_id", "client_id", "client_secret_cipher", "webhook_secret_cipher", "signing_secret_cipher", "vault_id" FROM `linear_publications`;--> statement-breakpoint
DROP TABLE `linear_publications`;--> statement-breakpoint
ALTER TABLE `__new_linear_publications` RENAME TO `linear_publications`;--> statement-breakpoint
PRAGMA foreign_keys=ON;--> statement-breakpoint
CREATE INDEX `idx_linear_publications_installation` ON `linear_publications` (`installation_id`);--> statement-breakpoint
CREATE INDEX `idx_linear_publications_user_agent` ON `linear_publications` (`user_id`,`agent_id`);--> statement-breakpoint
CREATE INDEX `idx_linear_publications_tenant` ON `linear_publications` (`tenant_id`,"created_at" DESC);